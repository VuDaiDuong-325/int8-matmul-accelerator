transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

vlib work
vlib riviera/xilinx_vip
vlib riviera/xpm
vlib riviera/axi_infrastructure_v1_1_0
vlib riviera/axi_vip_v1_1_22
vlib riviera/zynq_ultra_ps_e_vip_v1_0_22
vlib riviera/xil_defaultlib
vlib riviera/axi_datamover_v5_1_37
vlib riviera/axi_sg_v4_1_21
vlib riviera/axi_dma_v7_1_37
vlib riviera/proc_sys_reset_v5_0_17
vlib riviera/smartconnect_v1_0
vlib riviera/axi_register_slice_v2_1_36
vlib riviera/axi_lite_ipif_v3_0_4
vlib riviera/interrupt_control_v3_1_5
vlib riviera/axi_gpio_v2_0_37

vmap xilinx_vip riviera/xilinx_vip
vmap xpm riviera/xpm
vmap axi_infrastructure_v1_1_0 riviera/axi_infrastructure_v1_1_0
vmap axi_vip_v1_1_22 riviera/axi_vip_v1_1_22
vmap zynq_ultra_ps_e_vip_v1_0_22 riviera/zynq_ultra_ps_e_vip_v1_0_22
vmap xil_defaultlib riviera/xil_defaultlib
vmap axi_datamover_v5_1_37 riviera/axi_datamover_v5_1_37
vmap axi_sg_v4_1_21 riviera/axi_sg_v4_1_21
vmap axi_dma_v7_1_37 riviera/axi_dma_v7_1_37
vmap proc_sys_reset_v5_0_17 riviera/proc_sys_reset_v5_0_17
vmap smartconnect_v1_0 riviera/smartconnect_v1_0
vmap axi_register_slice_v2_1_36 riviera/axi_register_slice_v2_1_36
vmap axi_lite_ipif_v3_0_4 riviera/axi_lite_ipif_v3_0_4
vmap interrupt_control_v3_1_5 riviera/interrupt_control_v3_1_5
vmap axi_gpio_v2_0_37 riviera/axi_gpio_v2_0_37

vlog -work xilinx_vip  -incr "+incdir+E:/vivado/2025.2/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l zynq_ultra_ps_e_vip_v1_0_22 -l xil_defaultlib -l axi_datamover_v5_1_37 -l axi_sg_v4_1_21 -l axi_dma_v7_1_37 -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 -l axi_lite_ipif_v3_0_4 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_37 \
"E:/vivado/2025.2/Vivado/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
"E:/vivado/2025.2/Vivado/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
"E:/vivado/2025.2/Vivado/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
"E:/vivado/2025.2/Vivado/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
"E:/vivado/2025.2/Vivado/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
"E:/vivado/2025.2/Vivado/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
"E:/vivado/2025.2/Vivado/data/xilinx_vip/hdl/axi_vip_if.sv" \
"E:/vivado/2025.2/Vivado/data/xilinx_vip/hdl/clk_vip_if.sv" \
"E:/vivado/2025.2/Vivado/data/xilinx_vip/hdl/rst_vip_if.sv" \

vlog -work xpm  -incr "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/ec67/hdl" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/a0fe/hdl" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/f0b6/hdl/verilog" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/00fe/hdl/verilog" "+incdir+E:/vivado/2025.2/Vivado/data/rsb/busdef" "+incdir+E:/vivado/2025.2/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l zynq_ultra_ps_e_vip_v1_0_22 -l xil_defaultlib -l axi_datamover_v5_1_37 -l axi_sg_v4_1_21 -l axi_dma_v7_1_37 -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 -l axi_lite_ipif_v3_0_4 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_37 \
"E:/vivado/2025.2/Vivado/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"E:/vivado/2025.2/Vivado/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
"E:/vivado/2025.2/Vivado/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93  -incr \
"E:/vivado/2025.2/Vivado/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work axi_infrastructure_v1_1_0  -incr -v2k5 "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/ec67/hdl" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/a0fe/hdl" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/f0b6/hdl/verilog" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/00fe/hdl/verilog" "+incdir+E:/vivado/2025.2/Vivado/data/rsb/busdef" "+incdir+E:/vivado/2025.2/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l zynq_ultra_ps_e_vip_v1_0_22 -l xil_defaultlib -l axi_datamover_v5_1_37 -l axi_sg_v4_1_21 -l axi_dma_v7_1_37 -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 -l axi_lite_ipif_v3_0_4 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_37 \
"../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work axi_vip_v1_1_22  -incr "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/ec67/hdl" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/a0fe/hdl" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/f0b6/hdl/verilog" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/00fe/hdl/verilog" "+incdir+E:/vivado/2025.2/Vivado/data/rsb/busdef" "+incdir+E:/vivado/2025.2/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l zynq_ultra_ps_e_vip_v1_0_22 -l xil_defaultlib -l axi_datamover_v5_1_37 -l axi_sg_v4_1_21 -l axi_dma_v7_1_37 -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 -l axi_lite_ipif_v3_0_4 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_37 \
"../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/b16a/hdl/axi_vip_v1_1_vl_rfs.sv" \

vlog -work zynq_ultra_ps_e_vip_v1_0_22  -incr "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/ec67/hdl" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/a0fe/hdl" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/f0b6/hdl/verilog" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/00fe/hdl/verilog" "+incdir+E:/vivado/2025.2/Vivado/data/rsb/busdef" "+incdir+E:/vivado/2025.2/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l zynq_ultra_ps_e_vip_v1_0_22 -l xil_defaultlib -l axi_datamover_v5_1_37 -l axi_sg_v4_1_21 -l axi_dma_v7_1_37 -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 -l axi_lite_ipif_v3_0_4 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_37 \
"../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/a0fe/hdl/zynq_ultra_ps_e_vip_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -incr -v2k5 "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/ec67/hdl" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/a0fe/hdl" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/f0b6/hdl/verilog" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/00fe/hdl/verilog" "+incdir+E:/vivado/2025.2/Vivado/data/rsb/busdef" "+incdir+E:/vivado/2025.2/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l zynq_ultra_ps_e_vip_v1_0_22 -l xil_defaultlib -l axi_datamover_v5_1_37 -l axi_sg_v4_1_21 -l axi_dma_v7_1_37 -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 -l axi_lite_ipif_v3_0_4 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_37 \
"../../../bd/gemm_block/ip/gemm_block_zynq_ultra_ps_e_0_0/sim/gemm_block_zynq_ultra_ps_e_0_0_vip_wrapper.v" \

vcom -work axi_datamover_v5_1_37 -93  -incr \
"../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/d44a/hdl/axi_datamover_v5_1_vh_rfs.vhd" \

vcom -work axi_sg_v4_1_21 -93  -incr \
"../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/b193/hdl/axi_sg_v4_1_rfs.vhd" \

vcom -work axi_dma_v7_1_37 -93  -incr \
"../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/7f6a/hdl/axi_dma_v7_1_vh_rfs.vhd" \

vcom -work xil_defaultlib -93  -incr \
"../../../bd/gemm_block/ip/gemm_block_axi_dma_0_0/sim/gemm_block_axi_dma_0_0.vhd" \

vcom -work proc_sys_reset_v5_0_17 -93  -incr \
"../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/9438/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93  -incr \
"../../../bd/gemm_block/ip/gemm_block_axi_smc_0/bd_0/ip/ip_1/sim/bd_31d6_psr_aclk_0.vhd" \

vlog -work smartconnect_v1_0  -incr "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/ec67/hdl" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/a0fe/hdl" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/f0b6/hdl/verilog" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/00fe/hdl/verilog" "+incdir+E:/vivado/2025.2/Vivado/data/rsb/busdef" "+incdir+E:/vivado/2025.2/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l zynq_ultra_ps_e_vip_v1_0_22 -l xil_defaultlib -l axi_datamover_v5_1_37 -l axi_sg_v4_1_21 -l axi_dma_v7_1_37 -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 -l axi_lite_ipif_v3_0_4 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_37 \
"../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/f0b6/hdl/sc_util_v1_0_vl_rfs.sv" \
"../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/0848/hdl/sc_switchboard_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -incr "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/ec67/hdl" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/a0fe/hdl" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/f0b6/hdl/verilog" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/00fe/hdl/verilog" "+incdir+E:/vivado/2025.2/Vivado/data/rsb/busdef" "+incdir+E:/vivado/2025.2/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l zynq_ultra_ps_e_vip_v1_0_22 -l xil_defaultlib -l axi_datamover_v5_1_37 -l axi_sg_v4_1_21 -l axi_dma_v7_1_37 -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 -l axi_lite_ipif_v3_0_4 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_37 \
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

vlog -work smartconnect_v1_0  -incr "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/ec67/hdl" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/a0fe/hdl" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/f0b6/hdl/verilog" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/00fe/hdl/verilog" "+incdir+E:/vivado/2025.2/Vivado/data/rsb/busdef" "+incdir+E:/vivado/2025.2/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l zynq_ultra_ps_e_vip_v1_0_22 -l xil_defaultlib -l axi_datamover_v5_1_37 -l axi_sg_v4_1_21 -l axi_dma_v7_1_37 -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 -l axi_lite_ipif_v3_0_4 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_37 \
"../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/00fe/hdl/sc_node_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -incr "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/ec67/hdl" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/a0fe/hdl" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/f0b6/hdl/verilog" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/00fe/hdl/verilog" "+incdir+E:/vivado/2025.2/Vivado/data/rsb/busdef" "+incdir+E:/vivado/2025.2/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l zynq_ultra_ps_e_vip_v1_0_22 -l xil_defaultlib -l axi_datamover_v5_1_37 -l axi_sg_v4_1_21 -l axi_dma_v7_1_37 -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 -l axi_lite_ipif_v3_0_4 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_37 \
"../../../bd/gemm_block/ip/gemm_block_axi_smc_0/bd_0/ip/ip_12/sim/bd_31d6_arni_0.sv" \
"../../../bd/gemm_block/ip/gemm_block_axi_smc_0/bd_0/ip/ip_13/sim/bd_31d6_rni_0.sv" \
"../../../bd/gemm_block/ip/gemm_block_axi_smc_0/bd_0/ip/ip_14/sim/bd_31d6_awni_0.sv" \
"../../../bd/gemm_block/ip/gemm_block_axi_smc_0/bd_0/ip/ip_15/sim/bd_31d6_wni_0.sv" \
"../../../bd/gemm_block/ip/gemm_block_axi_smc_0/bd_0/ip/ip_16/sim/bd_31d6_bni_0.sv" \

vlog -work smartconnect_v1_0  -incr "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/ec67/hdl" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/a0fe/hdl" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/f0b6/hdl/verilog" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/00fe/hdl/verilog" "+incdir+E:/vivado/2025.2/Vivado/data/rsb/busdef" "+incdir+E:/vivado/2025.2/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l zynq_ultra_ps_e_vip_v1_0_22 -l xil_defaultlib -l axi_datamover_v5_1_37 -l axi_sg_v4_1_21 -l axi_dma_v7_1_37 -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 -l axi_lite_ipif_v3_0_4 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_37 \
"../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/3d9a/hdl/sc_mmu_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -incr "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/ec67/hdl" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/a0fe/hdl" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/f0b6/hdl/verilog" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/00fe/hdl/verilog" "+incdir+E:/vivado/2025.2/Vivado/data/rsb/busdef" "+incdir+E:/vivado/2025.2/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l zynq_ultra_ps_e_vip_v1_0_22 -l xil_defaultlib -l axi_datamover_v5_1_37 -l axi_sg_v4_1_21 -l axi_dma_v7_1_37 -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 -l axi_lite_ipif_v3_0_4 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_37 \
"../../../bd/gemm_block/ip/gemm_block_axi_smc_0/bd_0/ip/ip_17/sim/bd_31d6_s00mmu_0.sv" \

vlog -work smartconnect_v1_0  -incr "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/ec67/hdl" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/a0fe/hdl" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/f0b6/hdl/verilog" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/00fe/hdl/verilog" "+incdir+E:/vivado/2025.2/Vivado/data/rsb/busdef" "+incdir+E:/vivado/2025.2/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l zynq_ultra_ps_e_vip_v1_0_22 -l xil_defaultlib -l axi_datamover_v5_1_37 -l axi_sg_v4_1_21 -l axi_dma_v7_1_37 -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 -l axi_lite_ipif_v3_0_4 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_37 \
"../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/7785/hdl/sc_transaction_regulator_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -incr "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/ec67/hdl" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/a0fe/hdl" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/f0b6/hdl/verilog" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/00fe/hdl/verilog" "+incdir+E:/vivado/2025.2/Vivado/data/rsb/busdef" "+incdir+E:/vivado/2025.2/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l zynq_ultra_ps_e_vip_v1_0_22 -l xil_defaultlib -l axi_datamover_v5_1_37 -l axi_sg_v4_1_21 -l axi_dma_v7_1_37 -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 -l axi_lite_ipif_v3_0_4 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_37 \
"../../../bd/gemm_block/ip/gemm_block_axi_smc_0/bd_0/ip/ip_18/sim/bd_31d6_s00tr_0.sv" \

vlog -work smartconnect_v1_0  -incr "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/ec67/hdl" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/a0fe/hdl" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/f0b6/hdl/verilog" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/00fe/hdl/verilog" "+incdir+E:/vivado/2025.2/Vivado/data/rsb/busdef" "+incdir+E:/vivado/2025.2/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l zynq_ultra_ps_e_vip_v1_0_22 -l xil_defaultlib -l axi_datamover_v5_1_37 -l axi_sg_v4_1_21 -l axi_dma_v7_1_37 -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 -l axi_lite_ipif_v3_0_4 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_37 \
"../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/3051/hdl/sc_si_converter_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -incr "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/ec67/hdl" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/a0fe/hdl" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/f0b6/hdl/verilog" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/00fe/hdl/verilog" "+incdir+E:/vivado/2025.2/Vivado/data/rsb/busdef" "+incdir+E:/vivado/2025.2/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l zynq_ultra_ps_e_vip_v1_0_22 -l xil_defaultlib -l axi_datamover_v5_1_37 -l axi_sg_v4_1_21 -l axi_dma_v7_1_37 -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 -l axi_lite_ipif_v3_0_4 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_37 \
"../../../bd/gemm_block/ip/gemm_block_axi_smc_0/bd_0/ip/ip_19/sim/bd_31d6_s00sic_0.sv" \

vlog -work smartconnect_v1_0  -incr "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/ec67/hdl" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/a0fe/hdl" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/f0b6/hdl/verilog" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/00fe/hdl/verilog" "+incdir+E:/vivado/2025.2/Vivado/data/rsb/busdef" "+incdir+E:/vivado/2025.2/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l zynq_ultra_ps_e_vip_v1_0_22 -l xil_defaultlib -l axi_datamover_v5_1_37 -l axi_sg_v4_1_21 -l axi_dma_v7_1_37 -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 -l axi_lite_ipif_v3_0_4 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_37 \
"../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/852f/hdl/sc_axi2sc_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -incr "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/ec67/hdl" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/a0fe/hdl" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/f0b6/hdl/verilog" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/00fe/hdl/verilog" "+incdir+E:/vivado/2025.2/Vivado/data/rsb/busdef" "+incdir+E:/vivado/2025.2/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l zynq_ultra_ps_e_vip_v1_0_22 -l xil_defaultlib -l axi_datamover_v5_1_37 -l axi_sg_v4_1_21 -l axi_dma_v7_1_37 -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 -l axi_lite_ipif_v3_0_4 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_37 \
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

vlog -work smartconnect_v1_0  -incr "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/ec67/hdl" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/a0fe/hdl" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/f0b6/hdl/verilog" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/00fe/hdl/verilog" "+incdir+E:/vivado/2025.2/Vivado/data/rsb/busdef" "+incdir+E:/vivado/2025.2/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l zynq_ultra_ps_e_vip_v1_0_22 -l xil_defaultlib -l axi_datamover_v5_1_37 -l axi_sg_v4_1_21 -l axi_dma_v7_1_37 -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 -l axi_lite_ipif_v3_0_4 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_37 \
"../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/fca9/hdl/sc_sc2axi_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -incr "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/ec67/hdl" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/a0fe/hdl" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/f0b6/hdl/verilog" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/00fe/hdl/verilog" "+incdir+E:/vivado/2025.2/Vivado/data/rsb/busdef" "+incdir+E:/vivado/2025.2/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l zynq_ultra_ps_e_vip_v1_0_22 -l xil_defaultlib -l axi_datamover_v5_1_37 -l axi_sg_v4_1_21 -l axi_dma_v7_1_37 -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 -l axi_lite_ipif_v3_0_4 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_37 \
"../../../bd/gemm_block/ip/gemm_block_axi_smc_0/bd_0/ip/ip_35/sim/bd_31d6_m00s2a_0.sv" \
"../../../bd/gemm_block/ip/gemm_block_axi_smc_0/bd_0/ip/ip_36/sim/bd_31d6_m00arn_0.sv" \
"../../../bd/gemm_block/ip/gemm_block_axi_smc_0/bd_0/ip/ip_37/sim/bd_31d6_m00rn_0.sv" \
"../../../bd/gemm_block/ip/gemm_block_axi_smc_0/bd_0/ip/ip_38/sim/bd_31d6_m00awn_0.sv" \
"../../../bd/gemm_block/ip/gemm_block_axi_smc_0/bd_0/ip/ip_39/sim/bd_31d6_m00wn_0.sv" \
"../../../bd/gemm_block/ip/gemm_block_axi_smc_0/bd_0/ip/ip_40/sim/bd_31d6_m00bn_0.sv" \

vlog -work smartconnect_v1_0  -incr "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/ec67/hdl" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/a0fe/hdl" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/f0b6/hdl/verilog" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/00fe/hdl/verilog" "+incdir+E:/vivado/2025.2/Vivado/data/rsb/busdef" "+incdir+E:/vivado/2025.2/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l zynq_ultra_ps_e_vip_v1_0_22 -l xil_defaultlib -l axi_datamover_v5_1_37 -l axi_sg_v4_1_21 -l axi_dma_v7_1_37 -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 -l axi_lite_ipif_v3_0_4 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_37 \
"../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/e44a/hdl/sc_exit_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -incr "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/ec67/hdl" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/a0fe/hdl" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/f0b6/hdl/verilog" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/00fe/hdl/verilog" "+incdir+E:/vivado/2025.2/Vivado/data/rsb/busdef" "+incdir+E:/vivado/2025.2/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l zynq_ultra_ps_e_vip_v1_0_22 -l xil_defaultlib -l axi_datamover_v5_1_37 -l axi_sg_v4_1_21 -l axi_dma_v7_1_37 -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 -l axi_lite_ipif_v3_0_4 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_37 \
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
"../../../bd/gemm_block/ip/gemm_block_axi_smc_0/bd_0/ip/ip_56/sim/bd_31d6_m03s2a_0.sv" \
"../../../bd/gemm_block/ip/gemm_block_axi_smc_0/bd_0/ip/ip_57/sim/bd_31d6_m03arn_0.sv" \
"../../../bd/gemm_block/ip/gemm_block_axi_smc_0/bd_0/ip/ip_58/sim/bd_31d6_m03rn_0.sv" \
"../../../bd/gemm_block/ip/gemm_block_axi_smc_0/bd_0/ip/ip_59/sim/bd_31d6_m03awn_0.sv" \
"../../../bd/gemm_block/ip/gemm_block_axi_smc_0/bd_0/ip/ip_60/sim/bd_31d6_m03wn_0.sv" \
"../../../bd/gemm_block/ip/gemm_block_axi_smc_0/bd_0/ip/ip_61/sim/bd_31d6_m03bn_0.sv" \
"../../../bd/gemm_block/ip/gemm_block_axi_smc_0/bd_0/ip/ip_62/sim/bd_31d6_m03e_0.sv" \

vlog -work xil_defaultlib  -incr -v2k5 "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/ec67/hdl" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/a0fe/hdl" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/f0b6/hdl/verilog" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/00fe/hdl/verilog" "+incdir+E:/vivado/2025.2/Vivado/data/rsb/busdef" "+incdir+E:/vivado/2025.2/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l zynq_ultra_ps_e_vip_v1_0_22 -l xil_defaultlib -l axi_datamover_v5_1_37 -l axi_sg_v4_1_21 -l axi_dma_v7_1_37 -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 -l axi_lite_ipif_v3_0_4 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_37 \
"../../../bd/gemm_block/ip/gemm_block_axi_smc_0/bd_0/sim/bd_31d6.v" \

vcom -work smartconnect_v1_0 -93  -incr \
"../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/cb42/hdl/sc_ultralite_v1_0_rfs.vhd" \

vlog -work smartconnect_v1_0  -incr "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/ec67/hdl" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/a0fe/hdl" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/f0b6/hdl/verilog" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/00fe/hdl/verilog" "+incdir+E:/vivado/2025.2/Vivado/data/rsb/busdef" "+incdir+E:/vivado/2025.2/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l zynq_ultra_ps_e_vip_v1_0_22 -l xil_defaultlib -l axi_datamover_v5_1_37 -l axi_sg_v4_1_21 -l axi_dma_v7_1_37 -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 -l axi_lite_ipif_v3_0_4 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_37 \
"../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/cb42/hdl/sc_ultralite_v1_0_rfs.sv" \

vlog -work axi_register_slice_v2_1_36  -incr -v2k5 "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/ec67/hdl" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/a0fe/hdl" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/f0b6/hdl/verilog" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/00fe/hdl/verilog" "+incdir+E:/vivado/2025.2/Vivado/data/rsb/busdef" "+incdir+E:/vivado/2025.2/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l zynq_ultra_ps_e_vip_v1_0_22 -l xil_defaultlib -l axi_datamover_v5_1_37 -l axi_sg_v4_1_21 -l axi_dma_v7_1_37 -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 -l axi_lite_ipif_v3_0_4 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_37 \
"../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/bc4b/hdl/axi_register_slice_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -incr "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/ec67/hdl" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/a0fe/hdl" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/f0b6/hdl/verilog" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/00fe/hdl/verilog" "+incdir+E:/vivado/2025.2/Vivado/data/rsb/busdef" "+incdir+E:/vivado/2025.2/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l zynq_ultra_ps_e_vip_v1_0_22 -l xil_defaultlib -l axi_datamover_v5_1_37 -l axi_sg_v4_1_21 -l axi_dma_v7_1_37 -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 -l axi_lite_ipif_v3_0_4 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_37 \
"../../../bd/gemm_block/ip/gemm_block_axi_smc_0/sim/gemm_block_axi_smc_0.sv" \

vcom -work xil_defaultlib -93  -incr \
"../../../bd/gemm_block/ip/gemm_block_rst_ps8_0_99M_0/sim/gemm_block_rst_ps8_0_99M_0.vhd" \
"../../../bd/gemm_block/ip/gemm_block_axi_dma_1_0/sim/gemm_block_axi_dma_1_0.vhd" \
"../../../bd/gemm_block/ip/gemm_block_axi_smc_1_0/bd_0/ip/ip_1/sim/bd_90f7_psr_aclk_0.vhd" \

vlog -work xil_defaultlib  -incr "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/ec67/hdl" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/a0fe/hdl" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/f0b6/hdl/verilog" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/00fe/hdl/verilog" "+incdir+E:/vivado/2025.2/Vivado/data/rsb/busdef" "+incdir+E:/vivado/2025.2/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l zynq_ultra_ps_e_vip_v1_0_22 -l xil_defaultlib -l axi_datamover_v5_1_37 -l axi_sg_v4_1_21 -l axi_dma_v7_1_37 -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 -l axi_lite_ipif_v3_0_4 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_37 \
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

vlog -work xil_defaultlib  -incr -v2k5 "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/ec67/hdl" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/a0fe/hdl" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/f0b6/hdl/verilog" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/00fe/hdl/verilog" "+incdir+E:/vivado/2025.2/Vivado/data/rsb/busdef" "+incdir+E:/vivado/2025.2/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l zynq_ultra_ps_e_vip_v1_0_22 -l xil_defaultlib -l axi_datamover_v5_1_37 -l axi_sg_v4_1_21 -l axi_dma_v7_1_37 -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 -l axi_lite_ipif_v3_0_4 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_37 \
"../../../bd/gemm_block/ip/gemm_block_axi_smc_1_0/bd_0/sim/bd_90f7.v" \

vlog -work xil_defaultlib  -incr "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/ec67/hdl" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/a0fe/hdl" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/f0b6/hdl/verilog" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/00fe/hdl/verilog" "+incdir+E:/vivado/2025.2/Vivado/data/rsb/busdef" "+incdir+E:/vivado/2025.2/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l zynq_ultra_ps_e_vip_v1_0_22 -l xil_defaultlib -l axi_datamover_v5_1_37 -l axi_sg_v4_1_21 -l axi_dma_v7_1_37 -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 -l axi_lite_ipif_v3_0_4 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_37 \
"../../../bd/gemm_block/ip/gemm_block_axi_smc_1_0/sim/gemm_block_axi_smc_1_0.sv" \

vcom -work axi_lite_ipif_v3_0_4 -93  -incr \
"../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/66ea/hdl/axi_lite_ipif_v3_0_vh_rfs.vhd" \

vcom -work interrupt_control_v3_1_5 -93  -incr \
"../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/d8cc/hdl/interrupt_control_v3_1_vh_rfs.vhd" \

vcom -work axi_gpio_v2_0_37 -93  -incr \
"../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/0271/hdl/axi_gpio_v2_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93  -incr \
"../../../bd/gemm_block/ip/gemm_block_axi_gpio_0_0/sim/gemm_block_axi_gpio_0_0.vhd" \

vlog -work xil_defaultlib  -incr -v2k5 "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/ec67/hdl" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/a0fe/hdl" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/f0b6/hdl/verilog" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/00fe/hdl/verilog" "+incdir+E:/vivado/2025.2/Vivado/data/rsb/busdef" "+incdir+E:/vivado/2025.2/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l zynq_ultra_ps_e_vip_v1_0_22 -l xil_defaultlib -l axi_datamover_v5_1_37 -l axi_sg_v4_1_21 -l axi_dma_v7_1_37 -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 -l axi_lite_ipif_v3_0_4 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_37 \
"../../../bd/gemm_block/ip/gemm_block_gemm_accelerator_0_2/sim/gemm_block_gemm_accelerator_0_2.v" \

vcom -work xil_defaultlib -93  -incr \
"../../../bd/gemm_block/ip/gemm_block_axi_gpio_1_0/sim/gemm_block_axi_gpio_1_0.vhd" \

vlog -work xil_defaultlib  -incr -v2k5 "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/ec67/hdl" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/a0fe/hdl" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/f0b6/hdl/verilog" "+incdir+../../../../matmul.gen/sources_1/bd/gemm_block/ipshared/00fe/hdl/verilog" "+incdir+E:/vivado/2025.2/Vivado/data/rsb/busdef" "+incdir+E:/vivado/2025.2/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l zynq_ultra_ps_e_vip_v1_0_22 -l xil_defaultlib -l axi_datamover_v5_1_37 -l axi_sg_v4_1_21 -l axi_dma_v7_1_37 -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 -l axi_lite_ipif_v3_0_4 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_37 \
"../../../bd/gemm_block/sim/gemm_block.v" \

vlog -work xil_defaultlib \
"glbl.v"

