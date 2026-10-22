// =============================================================================
// gemm_test.c - Test / benchmark INT8 GEMM Accelerator v6, arbitrary M/K/N
//
// Usage:
//   sudo ./gemm_test M K N [-m mode] [-q style] [-r range] [-s seed]
//                         [--nocpu] [--sweep] [--dump prefix] [--csv file]
//                         [--uniform]
//
//   -m  1 = INT8 (default), 2 = raw INT32, 3 = both
//   -q  0 = legacy per-tensor quantization; 1 = randomized per-channel (default)
//   -r  input amplitude; range is normally [-r, r], default 127
//   -s  RNG seed (default 42)
//   --nocpu   skip CPU reference/verification (CSV CPU fields are -1)
//   --sweep   run six predefined sizes, including boundary and large cases
//   --dump p  write p_A.bin, p_B.bin, p_params.bin, p_C8.bin, p_C32.bin
//   --csv p   CSV output path (default: gemm_benchmark.csv)
//   --uniform use uniform random inputs; default uses random values near int8 limits
//
// Timing definitions:
//   cpu_ms          = CPU reference calculation time (only requested outputs)
//   transfer_in_ms  = software copies A/B/params into memory-mapped reserved DDR
//   execute_ms      = hardware START -> DONE interval (includes polling/driver latency)
//   transfer_out_ms = software copies enabled C output(s) from mapped DDR to heap
//   total_ms        = transfer_in_ms + execute_ms + transfer_out_ms
//   speedup         = cpu_ms / total_ms (end-to-end for the measured phases)
//
// Build:
//   gcc -O2 -Wall -Wextra -o gemm_test gemm_test.c
//   gcc -O2 -Wall -Wextra -DSW_ONLY -o gemm_ref gemm_test.c
// =============================================================================
#include "npu_driver.h"
#include <errno.h>
#include <inttypes.h>
#include <limits.h>

static uint32_t rng_state = 42;
static uint32_t rnd(void) {
    rng_state = rng_state * 1664525u + 1013904223u;
    return rng_state >> 8;
}

/*
 * Default edge-biased random data:
 * for r=127, exercise values {-128, -127, 126, 127}; otherwise
 * exercise {-r, -(r-1), r-1, r}. All remain in signed INT8 range.
 * --uniform restores the original uniform [-r, r] distribution.
 */
static int8_t gen_input(int range, int edge_data) {
    if (edge_data && range >= 4) {
        int lo = (range == 127) ? -128 : -range;
        int edge_values[4] = { lo, lo + 1, range - 1, range };
        return (int8_t)edge_values[rnd() & 3u];
    }
    return (int8_t)((int)(rnd() % (uint32_t)(2 * range + 1)) - range);
}

static void gen_params(npu_qparam_t *qp, uint32_t N, int style) {
    for (uint32_t n = 0; n < N; n++) {
        if (style == 0) {
            qp[n].bias = 0;
            qp[n].mult = 1;
            qp[n].shift = 8;
            qp[n].zp = 0;
        } else {
            qp[n].bias  = (int32_t)(rnd() % 2001) - 1000;
            qp[n].mult  = (int32_t)((1u << 30) + (rnd() % (1u << 30)));
            qp[n].shift = 38 + (int32_t)(rnd() % 3);
            qp[n].zp    = (int32_t)(rnd() % 21) - 10;
        }
    }
}

// CPU reference. B is transposed for contiguous access. The timing around this
// function includes B transposition/allocation as part of the CPU implementation.
static int cpu_ref(const int8_t *A, const int8_t *B, uint32_t M, uint32_t K, uint32_t N,
                   const npu_qparam_t *qp, int8_t *C8, int32_t *C32,
                   int calc_c8, int calc_c32) {
    int8_t *BT = malloc((size_t)N * K);
    if (!BT) return -1;

    for (uint32_t k = 0; k < K; k++)
        for (uint32_t n = 0; n < N; n++)
            BT[(size_t)n * K + k] = B[(size_t)k * N + n];

    for (uint32_t m = 0; m < M; m++) {
        const int8_t *a = A + (size_t)m * K;
        for (uint32_t n = 0; n < N; n++) {
            const int8_t *b = BT + (size_t)n * K;
            int32_t s = 0;
            for (uint32_t k = 0; k < K; k++)
                s += (int32_t)a[k] * (int32_t)b[k];

            if (calc_c32) C32[(size_t)m * N + n] = s;
            if (calc_c8)  C8[(size_t)m * N + n] = npu_requant_ref(s, qp[n]);
        }
    }
    free(BT);
    return 0;
}

static void dump_file(const char *prefix, const char *suffix, const void *p, size_t n) {
    char name[512];
    int len = snprintf(name, sizeof name, "%s_%s.bin", prefix, suffix);
    if (len < 0 || (size_t)len >= sizeof name) {
        fprintf(stderr, "[dump] filename too long for %s_%s.bin\n", prefix, suffix);
        return;
    }
    FILE *f = fopen(name, "wb");
    if (!f) {
        perror(name);
        return;
    }
    if (fwrite(p, 1, n, f) != n) perror(name);
    fclose(f);
}

#ifndef SW_ONLY

static void csv_write_row(FILE *csv,
                          uint32_t M, uint32_t K, uint32_t N,
                          double cpu_ms, double transfer_in_ms, double execute_ms,
                          double transfer_out_ms, double total_ms,
                          double cpu_gops, double hw_gops, double speedup,
                          const char *status) {
    if (!csv) return;
    fprintf(csv, "%u,%u,%u,", M, K, N);
    fprintf(csv, "%.9f,%.9f,%.9f,%.9f,%.9f,%.9f,%.9f,%.9f,%s\n",
            cpu_ms, transfer_in_ms, execute_ms, transfer_out_ms, total_ms,
            cpu_gops, hw_gops, speedup, status);
    fflush(csv);
}

static void print_ms(const char *label, double value) {
    if (value < 0.0) printf("%s=N/A ", label);
    else printf("%s=%.6fms ", label, value);
}

static void print_gops(const char *label, double value) {
    if (value < 0.0) printf("%s=N/A ", label);
    else printf("%s=%.4f ", label, value);
}

// Run one hardware case. Returns 0 on a verified PASS, positive for mismatches,
// and negative for setup/runtime errors. "UNVERIFIED" is used with --nocpu.
static int run_case(npu_t *d, uint32_t M, uint32_t K, uint32_t N,
                    int mode, int style, int range, int edge_data,
                    int do_cpu, int verbose, FILE *csv) {
    const size_t sA = (size_t)M * K;
    const size_t sB = (size_t)K * N;
    const size_t sC = (size_t)M * N;

    int8_t *A = malloc(sA);
    int8_t *B = malloc(sB);
    int8_t *C8 = calloc(sC, sizeof(*C8));
    int8_t *R8 = malloc(sC);
    int32_t *C32 = calloc(sC, sizeof(*C32));
    int32_t *R32 = malloc(sC * sizeof(*R32));
    npu_qparam_t *qp = malloc(sizeof(*qp) * N);

    double cpu_ms = -1.0, transfer_in_ms = -1.0, execute_ms = -1.0;
    double transfer_out_ms = -1.0, total_ms = -1.0;
    double cpu_gops = -1.0, hw_gops = -1.0, speedup = -1.0;
    const char *status = "FAIL";
    int result = -1;
    int csv_written = 0;

    if (!A || !B || !C8 || !R8 || !C32 || !R32 || !qp) {
        fprintf(stderr, "  [ERROR] khong du bo nho cho GEMM %ux%ux%u\n", M, K, N);
        goto cleanup;
    }

    for (size_t i = 0; i < sA; i++) A[i] = gen_input(range, edge_data);
    for (size_t i = 0; i < sB; i++) B[i] = gen_input(range, edge_data);
    gen_params(qp, N, style);

    npu_layout_t l = npu_layout(M, K, N);
    if (l.total > d->ddr_size) {
        printf("  [SKIP] need %.1f MB DDR, available %.1f MB\n",
               l.total / 1048576.0, d->ddr_size / 1048576.0);
        csv_write_row(csv, M, K, N, -1, -1, -1, -1, -1, -1, -1, -1, "SKIP");
        csv_written = 1;
        result = 0;  // preserve the previous behavior for an out-of-DDR case
        goto cleanup;
    }

    // CPU timing: compare the same GEMM and output mode as the hardware case.
    if (do_cpu) {
        double t0 = npu_now();
        if (cpu_ref(A, B, M, K, N, qp, R8, R32,
                    (mode & NPU_OUT_INT8) != 0, (mode & NPU_OUT_INT32) != 0) != 0) {
            fprintf(stderr, "  [ERROR] CPU reference allocation failed\n");
            goto cleanup;
        }
        cpu_ms = (npu_now() - t0) * 1e3;
        if (cpu_ms > 0.0)
            cpu_gops = (2.0 * (double)M * K * N) / (cpu_ms * 1e6);
    }

    // Sentinels are set outside the transfer-in interval.
    memset(d->ddr + l.off_c,   0xA5, (size_t)M * l.ldc);
    memset(d->ddr + l.off_c32, 0x5A, (size_t)M * l.ldc32);

    // This is CPU software copy into memory-mapped reserved DDR, not DMA time.
    double t_in = npu_now();
    npu_load_A(d, &l, A, M, K);
    npu_load_B(d, &l, B, K, N);
    npu_load_params(d, &l, qp, N);
    transfer_in_ms = (npu_now() - t_in) * 1e3;

    d->last_hw_ms = -1.0;  // prevent a previous case's time leaking into a timeout row
    int hw_rc = npu_run(d, &l, M, K, N, NPU_KDIM_DEFAULT, (uint32_t)mode, 600.0);
    execute_ms = d->last_hw_ms;
    if (hw_rc != 0) {
        fprintf(stderr, "  [ERROR] hardware run failed (rc=%d)\n", hw_rc);
        csv_write_row(csv, M, K, N, cpu_ms, transfer_in_ms, execute_ms,
                      -1, -1, cpu_gops, -1, -1, "FAIL");
        csv_written = 1;
        goto cleanup;
    }
    if (execute_ms > 0.0)
        hw_gops = (2.0 * (double)M * K * N) / (execute_ms * 1e6);

    // Measure copies of enabled output(s) from mapped DDR into ordinary CPU buffers.
    double t_out = npu_now();
    if (mode & NPU_OUT_INT8)  npu_read_C8(d, &l, C8, M, N);
    if (mode & NPU_OUT_INT32) npu_read_C32(d, &l, C32, M, N);
    transfer_out_ms = (npu_now() - t_out) * 1e3;
    total_ms = transfer_in_ms + execute_ms + transfer_out_ms;
    if (do_cpu && total_ms > 0.0) speedup = cpu_ms / total_ms;

    int errors = 0, err32 = 0, pad_bad = 0;
    int maxdiff8 = 0;
    int64_t maxdiff32 = 0;

    if ((mode & NPU_OUT_INT8) && do_cpu) {
        for (size_t i = 0; i < sC; i++) {
            if (C8[i] != R8[i]) {
                int df = abs((int)C8[i] - (int)R8[i]);
                if (df > maxdiff8) maxdiff8 = df;
                if (errors < 5 && verbose)
                    printf("    [MISMATCH INT8] m=%zu n=%zu HW=%d CPU=%d\n",
                           i / N, i % N, C8[i], R8[i]);
                errors++;
            }
        }
    }

    if ((mode & NPU_OUT_INT32) && do_cpu) {
        for (size_t i = 0; i < sC; i++) {
            if (C32[i] != R32[i]) {
                int64_t df = llabs((long long)C32[i] - (long long)R32[i]);
                if (df > maxdiff32) maxdiff32 = df;
                if (err32 < 5 && verbose)
                    printf("    [MISMATCH INT32] m=%zu n=%zu HW=%d CPU=%d\n",
                           i / N, i % N, C32[i], R32[i]);
                err32++;
            }
        }
    }

    if (mode & NPU_OUT_INT8) {
        for (uint32_t m = 0; m < M; m++)
            for (uint64_t j = N; j < l.ldc; j++)
                if (d->ddr[l.off_c + (uint64_t)m * l.ldc + j] != 0xA5) pad_bad++;
    } else {
        for (size_t j = 0; j < (size_t)M * l.ldc; j++) {
            if (d->ddr[l.off_c + j] != 0xA5) { pad_bad++; break; }
        }
    }

    if (mode & NPU_OUT_INT32) {
        for (uint32_t m = 0; m < M; m++)
            for (uint64_t j = 4 * (uint64_t)N; j < l.ldc32; j++)
                if (d->ddr[l.off_c32 + (uint64_t)m * l.ldc32 + j] != 0x5A) pad_bad++;
    } else {
        for (size_t j = 0; j < (size_t)M * l.ldc32; j++) {
            if (d->ddr[l.off_c32 + j] != 0x5A) { pad_bad++; break; }
        }
    }

    {
        int mismatches = errors + err32 + pad_bad;
        if (mismatches != 0) status = "FAIL";
        else status = do_cpu ? "PASS" : "UNVERIFIED";
        result = mismatches;
        if (!do_cpu && mismatches == 0) result = 0;
        if (mismatches != 0) result = mismatches;
    }

    printf("  GEMM %ux%ux%u mode=%d | ", M, K, N, mode);
    print_ms("CPU", cpu_ms);
    print_ms("In", transfer_in_ms);
    print_ms("Exec", execute_ms);
    print_ms("Out", transfer_out_ms);
    print_ms("Total", total_ms);
    print_gops("CPU_GOPS", cpu_gops);
    print_gops("HW_GOPS", hw_gops);
    if (speedup < 0.0) printf("Speedup_total=N/A ");
    else printf("Speedup_total=%.3fx ", speedup);
    if (do_cpu && execute_ms > 0.0) printf("Speedup_compute=%.3fx ", cpu_ms / execute_ms);
    else printf("Speedup_compute=N/A ");
    printf("| %s", status);
    if (errors || err32 || pad_bad)
        printf(" (INT8 mismatch=%d maxdiff=%d, INT32 mismatch=%d maxdiff=%" PRId64 ", padding=%d)",
               errors, maxdiff8, err32, maxdiff32, pad_bad);
    printf("\n");

    csv_write_row(csv, M, K, N, cpu_ms, transfer_in_ms, execute_ms,
                  transfer_out_ms, total_ms, cpu_gops, hw_gops, speedup, status);
    csv_written = 1;

cleanup:
    if (!csv_written && csv)
        csv_write_row(csv, M, K, N, cpu_ms, transfer_in_ms, execute_ms,
                      transfer_out_ms, total_ms, cpu_gops, hw_gops, speedup, "FAIL");
    free(A);
    free(B);
    free(C8);
    free(R8);
    free(C32);
    free(R32);
    free(qp);
    return result;
}
#endif  // !SW_ONLY

int main(int argc, char **argv) {
    uint32_t M = 0, K = 0, N = 0;
    int mode = 1, style = 1, range = 127, do_cpu = 1, sweep = 0, edge_data = 1;
    const char *dump = NULL;
    const char *csv_path = "gemm_benchmark.csv";
    int pos = 0;

    for (int i = 1; i < argc; i++) {
        if (!strcmp(argv[i], "-m") && i + 1 < argc) mode = atoi(argv[++i]);
        else if (!strcmp(argv[i], "-q") && i + 1 < argc) style = atoi(argv[++i]);
        else if (!strcmp(argv[i], "-r") && i + 1 < argc) range = atoi(argv[++i]);
        else if (!strcmp(argv[i], "-s") && i + 1 < argc) rng_state = (uint32_t)atoi(argv[++i]);
        else if (!strcmp(argv[i], "--nocpu")) do_cpu = 0;
        else if (!strcmp(argv[i], "--sweep")) sweep = 1;
        else if (!strcmp(argv[i], "--dump") && i + 1 < argc) dump = argv[++i];
        else if (!strcmp(argv[i], "--csv") && i + 1 < argc) csv_path = argv[++i];
        else if (!strcmp(argv[i], "--uniform")) edge_data = 0;
        else if (pos == 0) { M = (uint32_t)strtoul(argv[i], NULL, 10); pos++; }
        else if (pos == 1) { K = (uint32_t)strtoul(argv[i], NULL, 10); pos++; }
        else if (pos == 2) { N = (uint32_t)strtoul(argv[i], NULL, 10); pos++; }
        else {
            fprintf(stderr, "Argument khong hop le: %s\n", argv[i]);
            return 1;
        }
    }

    if (range < 1) range = 1;
    if (range > 127) range = 127;
    if (mode < 1 || mode > 3) {
        fprintf(stderr, "mode phai la 1..3\n");
        return 1;
    }

    printf("==============================================================\n");
    printf("  INT8 GEMM ACCELERATOR v6 - CPU/HW benchmark\n");
    printf("  Input: %s, range=%d, seed=%" PRIu32 "\n",
           edge_data ? "random edge-biased" : "uniform random", range, rng_state);
    printf("==============================================================\n");

    // Preserve the existing software-only golden-data dump workflow.
    if (dump && M && K && N) {
        size_t sA = (size_t)M * K, sB = (size_t)K * N, sC = (size_t)M * N;
        int8_t *A = malloc(sA), *B = malloc(sB), *R8 = malloc(sC);
        int32_t *R32 = malloc(sC * sizeof(*R32));
        npu_qparam_t *qp = malloc(sizeof(*qp) * N);
        if (!A || !B || !R8 || !R32 || !qp) {
            fprintf(stderr, "[dump] khong du bo nho\n");
            free(A); free(B); free(R8); free(R32); free(qp);
            return 1;
        }
        for (size_t i = 0; i < sA; i++) A[i] = gen_input(range, edge_data);
        for (size_t i = 0; i < sB; i++) B[i] = gen_input(range, edge_data);
        gen_params(qp, N, style);
        if (cpu_ref(A, B, M, K, N, qp, R8, R32, 1, 1) != 0) {
            fprintf(stderr, "[dump] CPU reference failed\n");
            free(A); free(B); free(R8); free(R32); free(qp);
            return 1;
        }
        dump_file(dump, "A", A, sA);
        dump_file(dump, "B", B, sB);
        dump_file(dump, "params", qp, sizeof(*qp) * N);
        dump_file(dump, "C8", R8, sC);
        dump_file(dump, "C32", R32, sC * sizeof(*R32));
        printf("  Da ghi tham chieu CPU %ux%ux%u vao %s_*.bin\n", M, K, N, dump);
        free(A); free(B); free(R8); free(R32); free(qp);
        return 0;
    }

#ifdef SW_ONLY
    (void)sweep;
    (void)do_cpu;
    (void)csv_path;
    fprintf(stderr, "Build SW_ONLY: chi ho tro --dump\n");
    return 1;
#else
    npu_t dev;
    if (npu_open(&dev) < 0) return 1;
    printf("  HW version reg = 0x%08x\n", dev.regs[NPU_REG_VERSION]);

    FILE *csv = fopen(csv_path, "w");
    if (!csv) {
        perror(csv_path);
        npu_close(&dev);
        return 1;
    }
    fprintf(csv, "M,K,N,cpu_ms,transfer_in_ms,execute_ms,transfer_out_ms,total_ms,cpu_gops,hw_gops,speedup,pass\n");
    fflush(csv);
    printf("  CSV report: %s\n", csv_path);
    printf("  Time fields are in ms; Transfer In/Out measure CPU memcpy to/from mapped DDR.\n");
    printf("  ------------------------------------------------------------------------------------------------------------------------------------\n");

    int bad = 0;
    if (sweep) {
        // Six chosen cases:
        // 1) 1x1x1; 2) all dimensions divisible by 256;
        // 3) two irregular dimensions; 4) large M/N > 2000 with modest K.
        static const uint32_t tests[][3] = {
            {   1,   1,    1},
            { 256, 256,  256},
            { 512, 512,  512},
            {  17,  33,   19},
            { 257, 257,  257},
            {2048,  32, 2048}
        };
        const size_t cases = sizeof(tests) / sizeof(tests[0]);
        for (size_t i = 0; i < cases; i++) {
            printf("  [%zu/%zu] ", i + 1, cases);
            int r = run_case(&dev, tests[i][0], tests[i][1], tests[i][2],
                             3, 1, range, edge_data, do_cpu, 1, csv);
            if (r != 0) bad++;
        }
        printf("\n  SWEEP: %zu cases, %d FAIL/ERROR\n", cases, bad);
    } else {
        if (!M || !K || !N) {
            fprintf(stderr, "Usage: %s M K N [-m mode] [-q style] [-r range] [-s seed] "
                            "[--nocpu] [--sweep] [--dump prefix] [--csv file] [--uniform]\n",
                    argv[0]);
            fclose(csv);
            npu_close(&dev);
            return 1;
        }
        bad = run_case(&dev, M, K, N, mode, style, range, edge_data, do_cpu, 1, csv);
        if (bad < 0) bad = 1;
    }

    fclose(csv);
    npu_close(&dev);
    return bad ? 1 : 0;
#endif
}
