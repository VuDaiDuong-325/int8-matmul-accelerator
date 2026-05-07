vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xilinx_vip
vlib modelsim_lib/msim/xpm
vlib modelsim_lib/msim/axi_infrastructure_v1_1_0
vlib modelsim_lib/msim/axi_vip_v1_1_22
vlib modelsim_lib/msim/zynq_ultra_ps_e_vip_v1_0_22
vlib modelsim_lib/msim/xil_defaultlib
vlib modelsim_lib/msim/axi_datamover_v5_1_37
vlib modelsim_lib/msim/axi_sg_v4_1_21
vlib modelsim_lib/msim/axi_dma_v7_1_37
vlib modelsim_lib/msim/proc_sys_reset_v5_0_17
vlib modelsim_lib/msim/smartconnect_v1_0
vlib modelsim_lib/msim/axi_register_slice_v2_1_36
vlib modelsim_lib/msim/axi_lite_ipif_v3_0_4
vlib modelsim_lib/msim/interrupt_control_v3_1_5
vlib modelsim_lib/msim/axi_gpio_v2_0_37

vmap xilinx_vip modelsim_lib/msim/xilinx_vip
vmap xpm modelsim_lib/msim/xpm
vmap axi_infrastructure_v1_1_0 modelsim_lib/msim/axi_infrastructure_v1_1_0
vmap axi_vip_v1_1_22 modelsim_lib/msim/axi_vip_v1_1_22
vmap zynq_ultra_ps_e_vip_v1_0_22 modelsim_lib/msim/zynq_ultra_ps_e_vip_v1_0_22
vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib
vmap axi_datamover_v5_1_37 modelsim_lib/msim/axi_datamover_v5_1_37
vmap axi_sg_v4_1_21 modelsim_lib/msim/axi_sg_v4_1_21
vmap axi_dma_v7_1_37 modelsim_lib/msim/axi_dma_v7_1_37
vmap proc_sys_reset_v5_0_17 modelsim_lib/msim/proc_sys_reset_v5_0_17
vmap smartconnect_v1_0 modelsim_lib/msim/smartconnect_v1_0
vmap axi_register_slice_v2_1_36 modelsim_lib/msim/axi_register_slice_v2_1_36
vmap axi_lite_ipif_v3_0_4 modelsim_lib/msim/axi_lite_ipif_v3_0_4
vmap interrupt_control_v3_1_5 modelsim_lib/msim/interrupt_control_v3_1_5
vmap axi_gpio_v2_0_37 modelsim_lib/msim/axi_gpio_v2_0_37

vlog -work xilinx_vip  -incr -mfcu  -sv -L smartconnect_v1_0 -L axi_vip_v1_1_22 -L zynq_ultra_ps_e_vip_v1_0_22 -L xilinx_vip "+incdir+D:/Apps/Study/Vivado/2025.2/Vivado/data/xilinx_vip/include" \
"D:/Apps/Study/Vivado/2025.2/Vivado/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
"D:/Apps/Study/Vivado/2025.2/Vivado/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
"D:/Apps/Study/Vivado/2025.2/Vivado/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
"D:/Apps/Study/Vivado/2025.2/Vivado/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
"D:/Apps/Study/Vivado/2025.2/Vivado/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
"D:/Apps/Study/Vivado/2025.2/Vivado/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
"D:/Apps/Study/Vivado/2025.2/Vivado/data/xilinx_vip/hdl/axi_vip_if.sv" \
"D:/Apps/Study/Vivado/2025.2/Vivado/data/xilinx_vip/hdl/clk_vip_if.sv" \
"D:/Apps/Study/Vivado/2025.2/Vivado/data/xilinx_vip/hdl/rst_vip_if.sv" \

vlog -work xpm  -incr -mfcu  -sv -L smartconnect_v1_0 -L axi_vip_v1_1_22 -L zynq_ultra_ps_e_vip_v1_0_22 -L xilinx_vip "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/ec67/hdl" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/a0fe/hdl" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/f0b6/hdl/verilog" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../../../Apps/Study/Vivado/2025.2/Vivado/data/rsb/busdef" "+incdir+D:/Apps/Study/Vivado/2025.2/Vivado/data/xilinx_vip/include" \
"D:/Apps/Study/Vivado/2025.2/Vivado/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"D:/Apps/Study/Vivado/2025.2/Vivado/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
"D:/Apps/Study/Vivado/2025.2/Vivado/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm  -93  \
"D:/Apps/Study/Vivado/2025.2/Vivado/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work axi_infrastructure_v1_1_0  -incr -mfcu  "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/ec67/hdl" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/a0fe/hdl" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/f0b6/hdl/verilog" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../../../Apps/Study/Vivado/2025.2/Vivado/data/rsb/busdef" "+incdir+D:/Apps/Study/Vivado/2025.2/Vivado/data/xilinx_vip/include" \
"../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work axi_vip_v1_1_22  -incr -mfcu  -sv -L smartconnect_v1_0 -L axi_vip_v1_1_22 -L zynq_ultra_ps_e_vip_v1_0_22 -L xilinx_vip "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/ec67/hdl" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/a0fe/hdl" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/f0b6/hdl/verilog" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../../../Apps/Study/Vivado/2025.2/Vivado/data/rsb/busdef" "+incdir+D:/Apps/Study/Vivado/2025.2/Vivado/data/xilinx_vip/include" \
"../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/b16a/hdl/axi_vip_v1_1_vl_rfs.sv" \

vlog -work zynq_ultra_ps_e_vip_v1_0_22  -incr -mfcu  -sv -L smartconnect_v1_0 -L axi_vip_v1_1_22 -L zynq_ultra_ps_e_vip_v1_0_22 -L xilinx_vip "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/ec67/hdl" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/a0fe/hdl" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/f0b6/hdl/verilog" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../../../Apps/Study/Vivado/2025.2/Vivado/data/rsb/busdef" "+incdir+D:/Apps/Study/Vivado/2025.2/Vivado/data/xilinx_vip/include" \
"../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/a0fe/hdl/zynq_ultra_ps_e_vip_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -incr -mfcu  "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/ec67/hdl" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/a0fe/hdl" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/f0b6/hdl/verilog" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../../../Apps/Study/Vivado/2025.2/Vivado/data/rsb/busdef" "+incdir+D:/Apps/Study/Vivado/2025.2/Vivado/data/xilinx_vip/include" \
"../../../bd/gemm_block/ip/gemm_block_zynq_ultra_ps_e_0_0/sim/gemm_block_zynq_ultra_ps_e_0_0_vip_wrapper.v" \

vcom -work axi_datamover_v5_1_37  -93  \
"../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/d44a/hdl/axi_datamover_v5_1_vh_rfs.vhd" \

vcom -work axi_sg_v4_1_21  -93  \
"../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/b193/hdl/axi_sg_v4_1_rfs.vhd" \

vcom -work axi_dma_v7_1_37  -93  \
"../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/7f6a/hdl/axi_dma_v7_1_vh_rfs.vhd" \

vcom -work xil_defaultlib  -93  \
"../../../bd/gemm_block/ip/gemm_block_axi_dma_0_0/sim/gemm_block_axi_dma_0_0.vhd" \

vlog -work xil_defaultlib  -incr -mfcu  "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/ec67/hdl" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/a0fe/hdl" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/f0b6/hdl/verilog" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../../../Apps/Study/Vivado/2025.2/Vivado/data/rsb/busdef" "+incdir+D:/Apps/Study/Vivado/2025.2/Vivado/data/xilinx_vip/include" \
"../../../bd/gemm_block/ipshared/830a/matmul/matmul.srcs/sources_1/imports/sources_1/new/mac_acc_stage.v" \
"../../../bd/gemm_block/ipshared/830a/matmul/matmul.srcs/sources_1/imports/sources_1/imports/new/mac_core.v" \
"../../../bd/gemm_block/ipshared/830a/matmul/matmul.srcs/sources_1/imports/sources_1/new/mac_mult_stage.v" \
"../../../bd/gemm_block/ipshared/830a/matmul/matmul.srcs/sources_1/imports/sources_1/imports/new/matmul_array.v" \
"../../../bd/gemm_block/ipshared/830a/matmul/matmul.srcs/sources_1/new/output_serializer.v" \
"../../../bd/gemm_block/ipshared/830a/matmul/matmul.srcs/sources_1/imports/sources_1/imports/new/pe_wrapper.v" \
"../../../bd/gemm_block/ipshared/830a/matmul/matmul.srcs/sources_1/new/sc_fifo.v" \
"../../../bd/gemm_block/ipshared/830a/matmul/matmul.srcs/sources_1/new/sc_fifo_fwft.v" \
"../../../bd/gemm_block/ipshared/830a/src/shift_register_delay.v" \
"../../../bd/gemm_block/ipshared/830a/src/skew_network.v" \
"../../../bd/gemm_block/ipshared/830a/src/systolic_dataflow_ctrl.v" \
"../../../bd/gemm_block/ipshared/830a/src/gemm_accelerator.v" \
"../../../bd/gemm_block/ip/gemm_block_gemm_accelerator_0_0/sim/gemm_block_gemm_accelerator_0_0.v" \
"../../../bd/gemm_block/ip/gemm_block_axi_smc_0/bd_0/sim/bd_31d6.v" \

vcom -work proc_sys_reset_v5_0_17  -93  \
"../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/9438/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib  -93  \
"../../../bd/gemm_block/ip/gemm_block_axi_smc_0/bd_0/ip/ip_1/sim/bd_31d6_psr_aclk_0.vhd" \

vlog -work smartconnect_v1_0  -incr -mfcu  -sv -L smartconnect_v1_0 -L axi_vip_v1_1_22 -L zynq_ultra_ps_e_vip_v1_0_22 -L xilinx_vip "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/ec67/hdl" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/a0fe/hdl" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/f0b6/hdl/verilog" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../../../Apps/Study/Vivado/2025.2/Vivado/data/rsb/busdef" "+incdir+D:/Apps/Study/Vivado/2025.2/Vivado/data/xilinx_vip/include" \
"../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/f0b6/hdl/sc_util_v1_0_vl_rfs.sv" \
"../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/0848/hdl/sc_switchboard_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -incr -mfcu  -sv -L smartconnect_v1_0 -L axi_vip_v1_1_22 -L zynq_ultra_ps_e_vip_v1_0_22 -L xilinx_vip "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/ec67/hdl" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/a0fe/hdl" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/f0b6/hdl/verilog" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../../../Apps/Study/Vivado/2025.2/Vivado/data/rsb/busdef" "+incdir+D:/Apps/Study/Vivado/2025.2/Vivado/data/xilinx_vip/include" \
"../../../bd/gemm_block/ip/gemm_block_axi_smc_0/bd_0/ip/ip_2/sim/bd_31d6_arinsw_0.sv" \
"../../../bd/gemm_block/ip/gemm_block_axi_smc_0/bd_0/ip/ip_3/sim/bd_31d6_rinsw_0.sv" \
"../../../bd/gemm_block/ip/gemm_block_axi_smc_0/bd_0/ip/ip_4/sim/bd_31d6_awinsw_0.sv" \
"../../../bd/gemm_block/ip/gemm_block_axi_smc_0/bd_0/ip/ip_5/sim/bd_31d6_winsw_0.sv" \
"../../../bd/gemm_block/ip/gemm_block_axi_smc_0/bd_0/ip/ip_6/sim/bd_31d6_binsw_0.sv" \
"../../../bd/gemm_block/ip/gemm_block_axi_smc_0/bd_0/ip/ip_7/sim/bd_31d6_aroutsw_0.sv" \
"../../../bd/gemm_block/ip/gemm_block_axi_smc_0/bd_0/ip/ip_8/sim/bd_31d6_routsw_0.sv" \
"../../../bd/gemm_block/ip/gemm_block_axi_smc_0/bd_0/ip/ip_9/sim/bd_31d6_awoutsw_0.sv" \
"../../../bd/gemm_block/ip/gemm_block_axi_smc_0/bd_0/ip/ip_10/sim/bd_31d6_woutsw_0.sv" \
"../../../bd/gemm_block/ip/gemm_block_axi_smc_0/bd_0/ip/ip_11/sim/bd_31d6_boutsw_0.sv" \

vlog -work smartconnect_v1_0  -incr -mfcu  -sv -L smartconnect_v1_0 -L axi_vip_v1_1_22 -L zynq_ultra_ps_e_vip_v1_0_22 -L xilinx_vip "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/ec67/hdl" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/a0fe/hdl" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/f0b6/hdl/verilog" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../../../Apps/Study/Vivado/2025.2/Vivado/data/rsb/busdef" "+incdir+D:/Apps/Study/Vivado/2025.2/Vivado/data/xilinx_vip/include" \
"../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/00fe/hdl/sc_node_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -incr -mfcu  -sv -L smartconnect_v1_0 -L axi_vip_v1_1_22 -L zynq_ultra_ps_e_vip_v1_0_22 -L xilinx_vip "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/ec67/hdl" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/a0fe/hdl" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/f0b6/hdl/verilog" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../../../Apps/Study/Vivado/2025.2/Vivado/data/rsb/busdef" "+incdir+D:/Apps/Study/Vivado/2025.2/Vivado/data/xilinx_vip/include" \
"../../../bd/gemm_block/ip/gemm_block_axi_smc_0/bd_0/ip/ip_12/sim/bd_31d6_arni_0.sv" \
"../../../bd/gemm_block/ip/gemm_block_axi_smc_0/bd_0/ip/ip_13/sim/bd_31d6_rni_0.sv" \
"../../../bd/gemm_block/ip/gemm_block_axi_smc_0/bd_0/ip/ip_14/sim/bd_31d6_awni_0.sv" \
"../../../bd/gemm_block/ip/gemm_block_axi_smc_0/bd_0/ip/ip_15/sim/bd_31d6_wni_0.sv" \
"../../../bd/gemm_block/ip/gemm_block_axi_smc_0/bd_0/ip/ip_16/sim/bd_31d6_bni_0.sv" \

vlog -work smartconnect_v1_0  -incr -mfcu  -sv -L smartconnect_v1_0 -L axi_vip_v1_1_22 -L zynq_ultra_ps_e_vip_v1_0_22 -L xilinx_vip "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/ec67/hdl" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/a0fe/hdl" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/f0b6/hdl/verilog" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../../../Apps/Study/Vivado/2025.2/Vivado/data/rsb/busdef" "+incdir+D:/Apps/Study/Vivado/2025.2/Vivado/data/xilinx_vip/include" \
"../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/3d9a/hdl/sc_mmu_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -incr -mfcu  -sv -L smartconnect_v1_0 -L axi_vip_v1_1_22 -L zynq_ultra_ps_e_vip_v1_0_22 -L xilinx_vip "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/ec67/hdl" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/a0fe/hdl" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/f0b6/hdl/verilog" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../../../Apps/Study/Vivado/2025.2/Vivado/data/rsb/busdef" "+incdir+D:/Apps/Study/Vivado/2025.2/Vivado/data/xilinx_vip/include" \
"../../../bd/gemm_block/ip/gemm_block_axi_smc_0/bd_0/ip/ip_17/sim/bd_31d6_s00mmu_0.sv" \

vlog -work smartconnect_v1_0  -incr -mfcu  -sv -L smartconnect_v1_0 -L axi_vip_v1_1_22 -L zynq_ultra_ps_e_vip_v1_0_22 -L xilinx_vip "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/ec67/hdl" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/a0fe/hdl" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/f0b6/hdl/verilog" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../../../Apps/Study/Vivado/2025.2/Vivado/data/rsb/busdef" "+incdir+D:/Apps/Study/Vivado/2025.2/Vivado/data/xilinx_vip/include" \
"../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/7785/hdl/sc_transaction_regulator_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -incr -mfcu  -sv -L smartconnect_v1_0 -L axi_vip_v1_1_22 -L zynq_ultra_ps_e_vip_v1_0_22 -L xilinx_vip "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/ec67/hdl" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/a0fe/hdl" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/f0b6/hdl/verilog" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../../../Apps/Study/Vivado/2025.2/Vivado/data/rsb/busdef" "+incdir+D:/Apps/Study/Vivado/2025.2/Vivado/data/xilinx_vip/include" \
"../../../bd/gemm_block/ip/gemm_block_axi_smc_0/bd_0/ip/ip_18/sim/bd_31d6_s00tr_0.sv" \

vlog -work smartconnect_v1_0  -incr -mfcu  -sv -L smartconnect_v1_0 -L axi_vip_v1_1_22 -L zynq_ultra_ps_e_vip_v1_0_22 -L xilinx_vip "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/ec67/hdl" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/a0fe/hdl" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/f0b6/hdl/verilog" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../../../Apps/Study/Vivado/2025.2/Vivado/data/rsb/busdef" "+incdir+D:/Apps/Study/Vivado/2025.2/Vivado/data/xilinx_vip/include" \
"../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/3051/hdl/sc_si_converter_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -incr -mfcu  -sv -L smartconnect_v1_0 -L axi_vip_v1_1_22 -L zynq_ultra_ps_e_vip_v1_0_22 -L xilinx_vip "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/ec67/hdl" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/a0fe/hdl" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/f0b6/hdl/verilog" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../../../Apps/Study/Vivado/2025.2/Vivado/data/rsb/busdef" "+incdir+D:/Apps/Study/Vivado/2025.2/Vivado/data/xilinx_vip/include" \
"../../../bd/gemm_block/ip/gemm_block_axi_smc_0/bd_0/ip/ip_19/sim/bd_31d6_s00sic_0.sv" \

vlog -work smartconnect_v1_0  -incr -mfcu  -sv -L smartconnect_v1_0 -L axi_vip_v1_1_22 -L zynq_ultra_ps_e_vip_v1_0_22 -L xilinx_vip "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/ec67/hdl" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/a0fe/hdl" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/f0b6/hdl/verilog" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../../../Apps/Study/Vivado/2025.2/Vivado/data/rsb/busdef" "+incdir+D:/Apps/Study/Vivado/2025.2/Vivado/data/xilinx_vip/include" \
"../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/852f/hdl/sc_axi2sc_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -incr -mfcu  -sv -L smartconnect_v1_0 -L axi_vip_v1_1_22 -L zynq_ultra_ps_e_vip_v1_0_22 -L xilinx_vip "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/ec67/hdl" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/a0fe/hdl" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/f0b6/hdl/verilog" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../../../Apps/Study/Vivado/2025.2/Vivado/data/rsb/busdef" "+incdir+D:/Apps/Study/Vivado/2025.2/Vivado/data/xilinx_vip/include" \
"../../../bd/gemm_block/ip/gemm_block_axi_smc_0/bd_0/ip/ip_20/sim/bd_31d6_s00a2s_0.sv" \
"../../../bd/gemm_block/ip/gemm_block_axi_smc_0/bd_0/ip/ip_21/sim/bd_31d6_sarn_0.sv" \
"../../../bd/gemm_block/ip/gemm_block_axi_smc_0/bd_0/ip/ip_22/sim/bd_31d6_srn_0.sv" \
"../../../bd/gemm_block/ip/gemm_block_axi_smc_0/bd_0/ip/ip_23/sim/bd_31d6_sawn_0.sv" \
"../../../bd/gemm_block/ip/gemm_block_axi_smc_0/bd_0/ip/ip_24/sim/bd_31d6_swn_0.sv" \
"../../../bd/gemm_block/ip/gemm_block_axi_smc_0/bd_0/ip/ip_25/sim/bd_31d6_sbn_0.sv" \
"../../../bd/gemm_block/ip/gemm_block_axi_smc_0/bd_0/ip/ip_26/sim/bd_31d6_s01mmu_0.sv" \
"../../../bd/gemm_block/ip/gemm_block_axi_smc_0/bd_0/ip/ip_27/sim/bd_31d6_s01tr_0.sv" \
"../../../bd/gemm_block/ip/gemm_block_axi_smc_0/bd_0/ip/ip_28/sim/bd_31d6_s01sic_0.sv" \
"../../../bd/gemm_block/ip/gemm_block_axi_smc_0/bd_0/ip/ip_29/sim/bd_31d6_s01a2s_0.sv" \
"../../../bd/gemm_block/ip/gemm_block_axi_smc_0/bd_0/ip/ip_30/sim/bd_31d6_sarn_1.sv" \
"../../../bd/gemm_block/ip/gemm_block_axi_smc_0/bd_0/ip/ip_31/sim/bd_31d6_srn_1.sv" \
"../../../bd/gemm_block/ip/gemm_block_axi_smc_0/bd_0/ip/ip_32/sim/bd_31d6_sawn_1.sv" \
"../../../bd/gemm_block/ip/gemm_block_axi_smc_0/bd_0/ip/ip_33/sim/bd_31d6_swn_1.sv" \
"../../../bd/gemm_block/ip/gemm_block_axi_smc_0/bd_0/ip/ip_34/sim/bd_31d6_sbn_1.sv" \

vlog -work smartconnect_v1_0  -incr -mfcu  -sv -L smartconnect_v1_0 -L axi_vip_v1_1_22 -L zynq_ultra_ps_e_vip_v1_0_22 -L xilinx_vip "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/ec67/hdl" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/a0fe/hdl" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/f0b6/hdl/verilog" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../../../Apps/Study/Vivado/2025.2/Vivado/data/rsb/busdef" "+incdir+D:/Apps/Study/Vivado/2025.2/Vivado/data/xilinx_vip/include" \
"../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/fca9/hdl/sc_sc2axi_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -incr -mfcu  -sv -L smartconnect_v1_0 -L axi_vip_v1_1_22 -L zynq_ultra_ps_e_vip_v1_0_22 -L xilinx_vip "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/ec67/hdl" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/a0fe/hdl" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/f0b6/hdl/verilog" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../../../Apps/Study/Vivado/2025.2/Vivado/data/rsb/busdef" "+incdir+D:/Apps/Study/Vivado/2025.2/Vivado/data/xilinx_vip/include" \
"../../../bd/gemm_block/ip/gemm_block_axi_smc_0/bd_0/ip/ip_35/sim/bd_31d6_m00s2a_0.sv" \
"../../../bd/gemm_block/ip/gemm_block_axi_smc_0/bd_0/ip/ip_36/sim/bd_31d6_m00arn_0.sv" \
"../../../bd/gemm_block/ip/gemm_block_axi_smc_0/bd_0/ip/ip_37/sim/bd_31d6_m00rn_0.sv" \
"../../../bd/gemm_block/ip/gemm_block_axi_smc_0/bd_0/ip/ip_38/sim/bd_31d6_m00awn_0.sv" \
"../../../bd/gemm_block/ip/gemm_block_axi_smc_0/bd_0/ip/ip_39/sim/bd_31d6_m00wn_0.sv" \
"../../../bd/gemm_block/ip/gemm_block_axi_smc_0/bd_0/ip/ip_40/sim/bd_31d6_m00bn_0.sv" \

vlog -work smartconnect_v1_0  -incr -mfcu  -sv -L smartconnect_v1_0 -L axi_vip_v1_1_22 -L zynq_ultra_ps_e_vip_v1_0_22 -L xilinx_vip "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/ec67/hdl" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/a0fe/hdl" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/f0b6/hdl/verilog" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../../../Apps/Study/Vivado/2025.2/Vivado/data/rsb/busdef" "+incdir+D:/Apps/Study/Vivado/2025.2/Vivado/data/xilinx_vip/include" \
"../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/e44a/hdl/sc_exit_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -incr -mfcu  -sv -L smartconnect_v1_0 -L axi_vip_v1_1_22 -L zynq_ultra_ps_e_vip_v1_0_22 -L xilinx_vip "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/ec67/hdl" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/a0fe/hdl" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/f0b6/hdl/verilog" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../../../Apps/Study/Vivado/2025.2/Vivado/data/rsb/busdef" "+incdir+D:/Apps/Study/Vivado/2025.2/Vivado/data/xilinx_vip/include" \
"../../../bd/gemm_block/ip/gemm_block_axi_smc_0/bd_0/ip/ip_41/sim/bd_31d6_m00e_0.sv" \
"../../../bd/gemm_block/ip/gemm_block_axi_smc_0/bd_0/ip/ip_42/sim/bd_31d6_m01s2a_0.sv" \
"../../../bd/gemm_block/ip/gemm_block_axi_smc_0/bd_0/ip/ip_43/sim/bd_31d6_m01arn_0.sv" \
"../../../bd/gemm_block/ip/gemm_block_axi_smc_0/bd_0/ip/ip_44/sim/bd_31d6_m01rn_0.sv" \
"../../../bd/gemm_block/ip/gemm_block_axi_smc_0/bd_0/ip/ip_45/sim/bd_31d6_m01awn_0.sv" \
"../../../bd/gemm_block/ip/gemm_block_axi_smc_0/bd_0/ip/ip_46/sim/bd_31d6_m01wn_0.sv" \
"../../../bd/gemm_block/ip/gemm_block_axi_smc_0/bd_0/ip/ip_47/sim/bd_31d6_m01bn_0.sv" \
"../../../bd/gemm_block/ip/gemm_block_axi_smc_0/bd_0/ip/ip_48/sim/bd_31d6_m01e_0.sv" \
"../../../bd/gemm_block/ip/gemm_block_axi_smc_0/bd_0/ip/ip_49/sim/bd_31d6_m02s2a_0.sv" \
"../../../bd/gemm_block/ip/gemm_block_axi_smc_0/bd_0/ip/ip_50/sim/bd_31d6_m02arn_0.sv" \
"../../../bd/gemm_block/ip/gemm_block_axi_smc_0/bd_0/ip/ip_51/sim/bd_31d6_m02rn_0.sv" \
"../../../bd/gemm_block/ip/gemm_block_axi_smc_0/bd_0/ip/ip_52/sim/bd_31d6_m02awn_0.sv" \
"../../../bd/gemm_block/ip/gemm_block_axi_smc_0/bd_0/ip/ip_53/sim/bd_31d6_m02wn_0.sv" \
"../../../bd/gemm_block/ip/gemm_block_axi_smc_0/bd_0/ip/ip_54/sim/bd_31d6_m02bn_0.sv" \
"../../../bd/gemm_block/ip/gemm_block_axi_smc_0/bd_0/ip/ip_55/sim/bd_31d6_m02e_0.sv" \

vcom -work smartconnect_v1_0  -93  \
"../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/cb42/hdl/sc_ultralite_v1_0_rfs.vhd" \

vlog -work smartconnect_v1_0  -incr -mfcu  -sv -L smartconnect_v1_0 -L axi_vip_v1_1_22 -L zynq_ultra_ps_e_vip_v1_0_22 -L xilinx_vip "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/ec67/hdl" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/a0fe/hdl" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/f0b6/hdl/verilog" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../../../Apps/Study/Vivado/2025.2/Vivado/data/rsb/busdef" "+incdir+D:/Apps/Study/Vivado/2025.2/Vivado/data/xilinx_vip/include" \
"../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/cb42/hdl/sc_ultralite_v1_0_rfs.sv" \

vlog -work axi_register_slice_v2_1_36  -incr -mfcu  "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/ec67/hdl" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/a0fe/hdl" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/f0b6/hdl/verilog" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../../../Apps/Study/Vivado/2025.2/Vivado/data/rsb/busdef" "+incdir+D:/Apps/Study/Vivado/2025.2/Vivado/data/xilinx_vip/include" \
"../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/bc4b/hdl/axi_register_slice_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -incr -mfcu  -sv -L smartconnect_v1_0 -L axi_vip_v1_1_22 -L zynq_ultra_ps_e_vip_v1_0_22 -L xilinx_vip "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/ec67/hdl" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/a0fe/hdl" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/f0b6/hdl/verilog" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../../../Apps/Study/Vivado/2025.2/Vivado/data/rsb/busdef" "+incdir+D:/Apps/Study/Vivado/2025.2/Vivado/data/xilinx_vip/include" \
"../../../bd/gemm_block/ip/gemm_block_axi_smc_0/sim/gemm_block_axi_smc_0.sv" \

vcom -work xil_defaultlib  -93  \
"../../../bd/gemm_block/ip/gemm_block_rst_ps8_0_99M_0/sim/gemm_block_rst_ps8_0_99M_0.vhd" \
"../../../bd/gemm_block/ip/gemm_block_axi_dma_1_0/sim/gemm_block_axi_dma_1_0.vhd" \

vlog -work xil_defaultlib  -incr -mfcu  "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/ec67/hdl" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/a0fe/hdl" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/f0b6/hdl/verilog" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../../../Apps/Study/Vivado/2025.2/Vivado/data/rsb/busdef" "+incdir+D:/Apps/Study/Vivado/2025.2/Vivado/data/xilinx_vip/include" \
"../../../bd/gemm_block/ip/gemm_block_axi_smc_1_0/bd_0/sim/bd_90f7.v" \

vcom -work xil_defaultlib  -93  \
"../../../bd/gemm_block/ip/gemm_block_axi_smc_1_0/bd_0/ip/ip_1/sim/bd_90f7_psr_aclk_0.vhd" \

vlog -work xil_defaultlib  -incr -mfcu  -sv -L smartconnect_v1_0 -L axi_vip_v1_1_22 -L zynq_ultra_ps_e_vip_v1_0_22 -L xilinx_vip "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/ec67/hdl" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/a0fe/hdl" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/f0b6/hdl/verilog" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../../../Apps/Study/Vivado/2025.2/Vivado/data/rsb/busdef" "+incdir+D:/Apps/Study/Vivado/2025.2/Vivado/data/xilinx_vip/include" \
"../../../bd/gemm_block/ip/gemm_block_axi_smc_1_0/bd_0/ip/ip_2/sim/bd_90f7_arsw_0.sv" \
"../../../bd/gemm_block/ip/gemm_block_axi_smc_1_0/bd_0/ip/ip_3/sim/bd_90f7_rsw_0.sv" \
"../../../bd/gemm_block/ip/gemm_block_axi_smc_1_0/bd_0/ip/ip_4/sim/bd_90f7_awsw_0.sv" \
"../../../bd/gemm_block/ip/gemm_block_axi_smc_1_0/bd_0/ip/ip_5/sim/bd_90f7_wsw_0.sv" \
"../../../bd/gemm_block/ip/gemm_block_axi_smc_1_0/bd_0/ip/ip_6/sim/bd_90f7_bsw_0.sv" \
"../../../bd/gemm_block/ip/gemm_block_axi_smc_1_0/bd_0/ip/ip_7/sim/bd_90f7_s00mmu_0.sv" \
"../../../bd/gemm_block/ip/gemm_block_axi_smc_1_0/bd_0/ip/ip_8/sim/bd_90f7_s00tr_0.sv" \
"../../../bd/gemm_block/ip/gemm_block_axi_smc_1_0/bd_0/ip/ip_9/sim/bd_90f7_s00sic_0.sv" \
"../../../bd/gemm_block/ip/gemm_block_axi_smc_1_0/bd_0/ip/ip_10/sim/bd_90f7_s00a2s_0.sv" \
"../../../bd/gemm_block/ip/gemm_block_axi_smc_1_0/bd_0/ip/ip_11/sim/bd_90f7_sarn_0.sv" \
"../../../bd/gemm_block/ip/gemm_block_axi_smc_1_0/bd_0/ip/ip_12/sim/bd_90f7_srn_0.sv" \
"../../../bd/gemm_block/ip/gemm_block_axi_smc_1_0/bd_0/ip/ip_13/sim/bd_90f7_s02mmu_0.sv" \
"../../../bd/gemm_block/ip/gemm_block_axi_smc_1_0/bd_0/ip/ip_14/sim/bd_90f7_s02tr_0.sv" \
"../../../bd/gemm_block/ip/gemm_block_axi_smc_1_0/bd_0/ip/ip_15/sim/bd_90f7_s02sic_0.sv" \
"../../../bd/gemm_block/ip/gemm_block_axi_smc_1_0/bd_0/ip/ip_16/sim/bd_90f7_s02a2s_0.sv" \
"../../../bd/gemm_block/ip/gemm_block_axi_smc_1_0/bd_0/ip/ip_17/sim/bd_90f7_sarn_1.sv" \
"../../../bd/gemm_block/ip/gemm_block_axi_smc_1_0/bd_0/ip/ip_18/sim/bd_90f7_srn_1.sv" \
"../../../bd/gemm_block/ip/gemm_block_axi_smc_1_0/bd_0/ip/ip_19/sim/bd_90f7_s03mmu_0.sv" \
"../../../bd/gemm_block/ip/gemm_block_axi_smc_1_0/bd_0/ip/ip_20/sim/bd_90f7_s03tr_0.sv" \
"../../../bd/gemm_block/ip/gemm_block_axi_smc_1_0/bd_0/ip/ip_21/sim/bd_90f7_s03sic_0.sv" \
"../../../bd/gemm_block/ip/gemm_block_axi_smc_1_0/bd_0/ip/ip_22/sim/bd_90f7_s03a2s_0.sv" \
"../../../bd/gemm_block/ip/gemm_block_axi_smc_1_0/bd_0/ip/ip_23/sim/bd_90f7_sawn_0.sv" \
"../../../bd/gemm_block/ip/gemm_block_axi_smc_1_0/bd_0/ip/ip_24/sim/bd_90f7_swn_0.sv" \
"../../../bd/gemm_block/ip/gemm_block_axi_smc_1_0/bd_0/ip/ip_25/sim/bd_90f7_sbn_0.sv" \
"../../../bd/gemm_block/ip/gemm_block_axi_smc_1_0/bd_0/ip/ip_26/sim/bd_90f7_m00s2a_0.sv" \
"../../../bd/gemm_block/ip/gemm_block_axi_smc_1_0/bd_0/ip/ip_27/sim/bd_90f7_m00arn_0.sv" \
"../../../bd/gemm_block/ip/gemm_block_axi_smc_1_0/bd_0/ip/ip_28/sim/bd_90f7_m00rn_0.sv" \
"../../../bd/gemm_block/ip/gemm_block_axi_smc_1_0/bd_0/ip/ip_29/sim/bd_90f7_m00awn_0.sv" \
"../../../bd/gemm_block/ip/gemm_block_axi_smc_1_0/bd_0/ip/ip_30/sim/bd_90f7_m00wn_0.sv" \
"../../../bd/gemm_block/ip/gemm_block_axi_smc_1_0/bd_0/ip/ip_31/sim/bd_90f7_m00bn_0.sv" \
"../../../bd/gemm_block/ip/gemm_block_axi_smc_1_0/bd_0/ip/ip_32/sim/bd_90f7_m00e_0.sv" \
"../../../bd/gemm_block/ip/gemm_block_axi_smc_1_0/sim/gemm_block_axi_smc_1_0.sv" \

vcom -work axi_lite_ipif_v3_0_4  -93  \
"../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/66ea/hdl/axi_lite_ipif_v3_0_vh_rfs.vhd" \

vcom -work interrupt_control_v3_1_5  -93  \
"../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/d8cc/hdl/interrupt_control_v3_1_vh_rfs.vhd" \

vcom -work axi_gpio_v2_0_37  -93  \
"../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/0271/hdl/axi_gpio_v2_0_vh_rfs.vhd" \

vcom -work xil_defaultlib  -93  \
"../../../bd/gemm_block/ip/gemm_block_axi_gpio_0_0/sim/gemm_block_axi_gpio_0_0.vhd" \

vlog -work xil_defaultlib  -incr -mfcu  "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/ec67/hdl" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/a0fe/hdl" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/f0b6/hdl/verilog" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../../../Apps/Study/Vivado/2025.2/Vivado/data/rsb/busdef" "+incdir+D:/Apps/Study/Vivado/2025.2/Vivado/data/xilinx_vip/include" \
"../../../bd/gemm_block/sim/gemm_block.v" \

vlog -work xil_defaultlib \
"glbl.v"

