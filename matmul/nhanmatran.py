import numpy as np


# =====================================
# 1. PARSE FILE
# =====================================
def parse_matrices(filename):
    with open(filename, 'r') as f:
        lines = f.readlines()

    A, B, C = [], [], []
    current = None

    for line in lines:
        line = line.strip()

        if "MA TRAN A" in line:
            current = "A"
            continue
        elif "MA TRAN B" in line:
            current = "B"
            continue
        elif "MA TRAN C" in line:
            current = "C"
            continue

        # bỏ dòng rỗng hoặc =====
        if line == "" or "=" in line:
            continue

        row = list(map(int, line.split()))

        if current == "A":
            A.append(row)
        elif current == "B":
            B.append(row)
        elif current == "C":
            C.append(row)

    return np.array(A), np.array(B), np.array(C)


# =====================================
# 2. SO SÁNH
# =====================================
def compare(C_calc, C_ref):
    if C_calc.shape != C_ref.shape:
        print("❌ Shape mismatch!")
        print("Calc:", C_calc.shape, "Ref:", C_ref.shape)
        return

    error = 0

    for i in range(C_calc.shape[0]):
        for j in range(C_calc.shape[1]):
            if C_calc[i, j] != C_ref[i, j]:
                print(f"❌ [{i},{j}] Calc={C_calc[i,j]} Ref={C_ref[i,j]}")
                error += 1

    if error == 0:
        print("✅ MATCH 100%")
    else:
        print(f"⚠️ Total errors: {error}")


# =====================================
# 3. MAIN
# =====================================
if __name__ == "__main__":
    A, B, C_ref = parse_matrices("matran.txt")

    print("A shape:", A.shape)
    print("B shape:", B.shape)
    print("C_ref shape:", C_ref.shape)

    # Tính C = A * B
    C_calc = np.matmul(A, B)

    print("\n--- Checking result ---")
    compare(C_calc, C_ref)