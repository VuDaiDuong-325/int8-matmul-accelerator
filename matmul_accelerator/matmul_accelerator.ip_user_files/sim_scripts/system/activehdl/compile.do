transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

vlib work
vlib activehdl/xilinx_vip
vlib activehdl/xpm
vlib activehdl/xil_defaultlib
vlib activehdl/axi_infrastructure_v1_1_0
vlib activehdl/axi_vip_v1_1_22
vlib activehdl/zynq_ultra_ps_e_vip_v1_0_22
vlib activehdl/proc_sys_reset_v5_0_17
vlib activehdl/smartconnect_v1_0
vlib activehdl/axi_register_slice_v2_1_36

vmap xilinx_vip activehdl/xilinx_vip
vmap xpm activehdl/xpm
vmap xil_defaultlib activehdl/xil_defaultlib
vmap axi_infrastructure_v1_1_0 activehdl/axi_infrastructure_v1_1_0
vmap axi_vip_v1_1_22 activehdl/axi_vip_v1_1_22
vmap zynq_ultra_ps_e_vip_v1_0_22 activehdl/zynq_ultra_ps_e_vip_v1_0_22
vmap proc_sys_reset_v5_0_17 activehdl/proc_sys_reset_v5_0_17
vmap smartconnect_v1_0 activehdl/smartconnect_v1_0
vmap axi_register_slice_v2_1_36 activehdl/axi_register_slice_v2_1_36

vlog -work xilinx_vip  -sv2k12 "+incdir+D:/Apps/Study/Vivado/2025.2/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l xil_defaultlib -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l zynq_ultra_ps_e_vip_v1_0_22 -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 \
"D:/Apps/Study/Vivado/2025.2/Vivado/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
"D:/Apps/Study/Vivado/2025.2/Vivado/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
"D:/Apps/Study/Vivado/2025.2/Vivado/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
"D:/Apps/Study/Vivado/2025.2/Vivado/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
"D:/Apps/Study/Vivado/2025.2/Vivado/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
"D:/Apps/Study/Vivado/2025.2/Vivado/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
"D:/Apps/Study/Vivado/2025.2/Vivado/data/xilinx_vip/hdl/axi_vip_if.sv" \
"D:/Apps/Study/Vivado/2025.2/Vivado/data/xilinx_vip/hdl/clk_vip_if.sv" \
"D:/Apps/Study/Vivado/2025.2/Vivado/data/xilinx_vip/hdl/rst_vip_if.sv" \

vlog -work xpm  -sv2k12 "+incdir+../../../../matmul_accelerator.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../matmul_accelerator.gen/sources_1/bd/system/ipshared/a0fe/hdl" "+incdir+../../../../matmul_accelerator.gen/sources_1/bd/system/ipshared/f0b6/hdl/verilog" "+incdir+../../../../matmul_accelerator.gen/sources_1/bd/system/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../Apps/Study/Vivado/2025.2/Vivado/data/rsb/busdef" "+incdir+D:/Apps/Study/Vivado/2025.2/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l xil_defaultlib -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l zynq_ultra_ps_e_vip_v1_0_22 -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 \
"D:/Apps/Study/Vivado/2025.2/Vivado/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"D:/Apps/Study/Vivado/2025.2/Vivado/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
"D:/Apps/Study/Vivado/2025.2/Vivado/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93  \
"D:/Apps/Study/Vivado/2025.2/Vivado/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../matmul_accelerator.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../matmul_accelerator.gen/sources_1/bd/system/ipshared/a0fe/hdl" "+incdir+../../../../matmul_accelerator.gen/sources_1/bd/system/ipshared/f0b6/hdl/verilog" "+incdir+../../../../matmul_accelerator.gen/sources_1/bd/system/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../Apps/Study/Vivado/2025.2/Vivado/data/rsb/busdef" "+incdir+D:/Apps/Study/Vivado/2025.2/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l xil_defaultlib -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l zynq_ultra_ps_e_vip_v1_0_22 -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 \
"../../../bd/system/ipshared/e388/hdl/npu_axi_ip_slave_lite_v1_0_S00_AXI.v" \
"../../../bd/system/ipshared/e388/hdl/npu_axi_ip.v" \
"../../../bd/system/ipshared/e388/5460/input_buffer_skew.v" \
"../../../bd/system/ipshared/e388/5460/mac_acc_stage.v" \
"../../../bd/system/ipshared/e388/2cb7/mac_core.v" \
"../../../bd/system/ipshared/e388/5460/mac_mult_stage.v" \
"../../../bd/system/ipshared/e388/2cb7/matmul_array.v" \
"../../../bd/system/ipshared/e388/5460/npu_addr_gen.v" \
"../../../bd/system/ipshared/e388/5460/npu_control_unit.v" \
"../../../bd/system/ipshared/e388/5460/npu_core.v" \
"../../../bd/system/ipshared/e388/5460/npu_local_mem.v" \
"../../../bd/system/ipshared/e388/5460/npu_top.v" \
"../../../bd/system/ipshared/e388/5460/oc_ctrl.v" \
"../../../bd/system/ipshared/e388/5460/oc_handler.v" \
"../../../bd/system/ipshared/e388/5460/oc_scan_engine.v" \
"../../../bd/system/ipshared/e388/5460/output_collector.v" \
"../../../bd/system/ipshared/e388/2cb7/pe_wrapper.v" \
"../../../bd/system/ip/system_npu_axi_ip_0_0/sim/system_npu_axi_ip_0_0.v" \

vlog -work axi_infrastructure_v1_1_0  -v2k5 "+incdir+../../../../matmul_accelerator.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../matmul_accelerator.gen/sources_1/bd/system/ipshared/a0fe/hdl" "+incdir+../../../../matmul_accelerator.gen/sources_1/bd/system/ipshared/f0b6/hdl/verilog" "+incdir+../../../../matmul_accelerator.gen/sources_1/bd/system/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../Apps/Study/Vivado/2025.2/Vivado/data/rsb/busdef" "+incdir+D:/Apps/Study/Vivado/2025.2/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l xil_defaultlib -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l zynq_ultra_ps_e_vip_v1_0_22 -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 \
"../../../../matmul_accelerator.gen/sources_1/bd/system/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work axi_vip_v1_1_22  -sv2k12 "+incdir+../../../../matmul_accelerator.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../matmul_accelerator.gen/sources_1/bd/system/ipshared/a0fe/hdl" "+incdir+../../../../matmul_accelerator.gen/sources_1/bd/system/ipshared/f0b6/hdl/verilog" "+incdir+../../../../matmul_accelerator.gen/sources_1/bd/system/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../Apps/Study/Vivado/2025.2/Vivado/data/rsb/busdef" "+incdir+D:/Apps/Study/Vivado/2025.2/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l xil_defaultlib -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l zynq_ultra_ps_e_vip_v1_0_22 -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 \
"../../../../matmul_accelerator.gen/sources_1/bd/system/ipshared/b16a/hdl/axi_vip_v1_1_vl_rfs.sv" \

vlog -work zynq_ultra_ps_e_vip_v1_0_22  -sv2k12 "+incdir+../../../../matmul_accelerator.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../matmul_accelerator.gen/sources_1/bd/system/ipshared/a0fe/hdl" "+incdir+../../../../matmul_accelerator.gen/sources_1/bd/system/ipshared/f0b6/hdl/verilog" "+incdir+../../../../matmul_accelerator.gen/sources_1/bd/system/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../Apps/Study/Vivado/2025.2/Vivado/data/rsb/busdef" "+incdir+D:/Apps/Study/Vivado/2025.2/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l xil_defaultlib -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l zynq_ultra_ps_e_vip_v1_0_22 -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 \
"../../../../matmul_accelerator.gen/sources_1/bd/system/ipshared/a0fe/hdl/zynq_ultra_ps_e_vip_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../matmul_accelerator.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../matmul_accelerator.gen/sources_1/bd/system/ipshared/a0fe/hdl" "+incdir+../../../../matmul_accelerator.gen/sources_1/bd/system/ipshared/f0b6/hdl/verilog" "+incdir+../../../../matmul_accelerator.gen/sources_1/bd/system/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../Apps/Study/Vivado/2025.2/Vivado/data/rsb/busdef" "+incdir+D:/Apps/Study/Vivado/2025.2/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l xil_defaultlib -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l zynq_ultra_ps_e_vip_v1_0_22 -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 \
"../../../bd/system/ip/system_zynq_ultra_ps_e_0_0/sim/system_zynq_ultra_ps_e_0_0_vip_wrapper.v" \
"../../../bd/system/ip/system_axi_smc_0/bd_0/sim/bd_44e3.v" \

vcom -work proc_sys_reset_v5_0_17 -93  \
"../../../../matmul_accelerator.gen/sources_1/bd/system/ipshared/9438/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93  \
"../../../bd/system/ip/system_axi_smc_0/bd_0/ip/ip_1/sim/bd_44e3_psr_aclk_0.vhd" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../matmul_accelerator.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../matmul_accelerator.gen/sources_1/bd/system/ipshared/a0fe/hdl" "+incdir+../../../../matmul_accelerator.gen/sources_1/bd/system/ipshared/f0b6/hdl/verilog" "+incdir+../../../../matmul_accelerator.gen/sources_1/bd/system/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../Apps/Study/Vivado/2025.2/Vivado/data/rsb/busdef" "+incdir+D:/Apps/Study/Vivado/2025.2/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l xil_defaultlib -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l zynq_ultra_ps_e_vip_v1_0_22 -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 \
"../../../../matmul_accelerator.gen/sources_1/bd/system/ipshared/f0b6/hdl/sc_util_v1_0_vl_rfs.sv" \
"../../../../matmul_accelerator.gen/sources_1/bd/system/ipshared/0848/hdl/sc_switchboard_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../matmul_accelerator.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../matmul_accelerator.gen/sources_1/bd/system/ipshared/a0fe/hdl" "+incdir+../../../../matmul_accelerator.gen/sources_1/bd/system/ipshared/f0b6/hdl/verilog" "+incdir+../../../../matmul_accelerator.gen/sources_1/bd/system/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../Apps/Study/Vivado/2025.2/Vivado/data/rsb/busdef" "+incdir+D:/Apps/Study/Vivado/2025.2/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l xil_defaultlib -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l zynq_ultra_ps_e_vip_v1_0_22 -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 \
"../../../bd/system/ip/system_axi_smc_0/bd_0/ip/ip_2/sim/bd_44e3_arinsw_0.sv" \
"../../../bd/system/ip/system_axi_smc_0/bd_0/ip/ip_3/sim/bd_44e3_rinsw_0.sv" \
"../../../bd/system/ip/system_axi_smc_0/bd_0/ip/ip_4/sim/bd_44e3_awinsw_0.sv" \
"../../../bd/system/ip/system_axi_smc_0/bd_0/ip/ip_5/sim/bd_44e3_winsw_0.sv" \
"../../../bd/system/ip/system_axi_smc_0/bd_0/ip/ip_6/sim/bd_44e3_binsw_0.sv" \
"../../../bd/system/ip/system_axi_smc_0/bd_0/ip/ip_7/sim/bd_44e3_aroutsw_0.sv" \
"../../../bd/system/ip/system_axi_smc_0/bd_0/ip/ip_8/sim/bd_44e3_routsw_0.sv" \
"../../../bd/system/ip/system_axi_smc_0/bd_0/ip/ip_9/sim/bd_44e3_awoutsw_0.sv" \
"../../../bd/system/ip/system_axi_smc_0/bd_0/ip/ip_10/sim/bd_44e3_woutsw_0.sv" \
"../../../bd/system/ip/system_axi_smc_0/bd_0/ip/ip_11/sim/bd_44e3_boutsw_0.sv" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../matmul_accelerator.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../matmul_accelerator.gen/sources_1/bd/system/ipshared/a0fe/hdl" "+incdir+../../../../matmul_accelerator.gen/sources_1/bd/system/ipshared/f0b6/hdl/verilog" "+incdir+../../../../matmul_accelerator.gen/sources_1/bd/system/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../Apps/Study/Vivado/2025.2/Vivado/data/rsb/busdef" "+incdir+D:/Apps/Study/Vivado/2025.2/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l xil_defaultlib -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l zynq_ultra_ps_e_vip_v1_0_22 -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 \
"../../../../matmul_accelerator.gen/sources_1/bd/system/ipshared/00fe/hdl/sc_node_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../matmul_accelerator.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../matmul_accelerator.gen/sources_1/bd/system/ipshared/a0fe/hdl" "+incdir+../../../../matmul_accelerator.gen/sources_1/bd/system/ipshared/f0b6/hdl/verilog" "+incdir+../../../../matmul_accelerator.gen/sources_1/bd/system/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../Apps/Study/Vivado/2025.2/Vivado/data/rsb/busdef" "+incdir+D:/Apps/Study/Vivado/2025.2/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l xil_defaultlib -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l zynq_ultra_ps_e_vip_v1_0_22 -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 \
"../../../bd/system/ip/system_axi_smc_0/bd_0/ip/ip_12/sim/bd_44e3_arni_0.sv" \
"../../../bd/system/ip/system_axi_smc_0/bd_0/ip/ip_13/sim/bd_44e3_rni_0.sv" \
"../../../bd/system/ip/system_axi_smc_0/bd_0/ip/ip_14/sim/bd_44e3_awni_0.sv" \
"../../../bd/system/ip/system_axi_smc_0/bd_0/ip/ip_15/sim/bd_44e3_wni_0.sv" \
"../../../bd/system/ip/system_axi_smc_0/bd_0/ip/ip_16/sim/bd_44e3_bni_0.sv" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../matmul_accelerator.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../matmul_accelerator.gen/sources_1/bd/system/ipshared/a0fe/hdl" "+incdir+../../../../matmul_accelerator.gen/sources_1/bd/system/ipshared/f0b6/hdl/verilog" "+incdir+../../../../matmul_accelerator.gen/sources_1/bd/system/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../Apps/Study/Vivado/2025.2/Vivado/data/rsb/busdef" "+incdir+D:/Apps/Study/Vivado/2025.2/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l xil_defaultlib -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l zynq_ultra_ps_e_vip_v1_0_22 -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 \
"../../../../matmul_accelerator.gen/sources_1/bd/system/ipshared/3d9a/hdl/sc_mmu_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../matmul_accelerator.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../matmul_accelerator.gen/sources_1/bd/system/ipshared/a0fe/hdl" "+incdir+../../../../matmul_accelerator.gen/sources_1/bd/system/ipshared/f0b6/hdl/verilog" "+incdir+../../../../matmul_accelerator.gen/sources_1/bd/system/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../Apps/Study/Vivado/2025.2/Vivado/data/rsb/busdef" "+incdir+D:/Apps/Study/Vivado/2025.2/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l xil_defaultlib -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l zynq_ultra_ps_e_vip_v1_0_22 -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 \
"../../../bd/system/ip/system_axi_smc_0/bd_0/ip/ip_17/sim/bd_44e3_s00mmu_0.sv" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../matmul_accelerator.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../matmul_accelerator.gen/sources_1/bd/system/ipshared/a0fe/hdl" "+incdir+../../../../matmul_accelerator.gen/sources_1/bd/system/ipshared/f0b6/hdl/verilog" "+incdir+../../../../matmul_accelerator.gen/sources_1/bd/system/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../Apps/Study/Vivado/2025.2/Vivado/data/rsb/busdef" "+incdir+D:/Apps/Study/Vivado/2025.2/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l xil_defaultlib -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l zynq_ultra_ps_e_vip_v1_0_22 -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 \
"../../../../matmul_accelerator.gen/sources_1/bd/system/ipshared/7785/hdl/sc_transaction_regulator_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../matmul_accelerator.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../matmul_accelerator.gen/sources_1/bd/system/ipshared/a0fe/hdl" "+incdir+../../../../matmul_accelerator.gen/sources_1/bd/system/ipshared/f0b6/hdl/verilog" "+incdir+../../../../matmul_accelerator.gen/sources_1/bd/system/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../Apps/Study/Vivado/2025.2/Vivado/data/rsb/busdef" "+incdir+D:/Apps/Study/Vivado/2025.2/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l xil_defaultlib -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l zynq_ultra_ps_e_vip_v1_0_22 -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 \
"../../../bd/system/ip/system_axi_smc_0/bd_0/ip/ip_18/sim/bd_44e3_s00tr_0.sv" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../matmul_accelerator.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../matmul_accelerator.gen/sources_1/bd/system/ipshared/a0fe/hdl" "+incdir+../../../../matmul_accelerator.gen/sources_1/bd/system/ipshared/f0b6/hdl/verilog" "+incdir+../../../../matmul_accelerator.gen/sources_1/bd/system/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../Apps/Study/Vivado/2025.2/Vivado/data/rsb/busdef" "+incdir+D:/Apps/Study/Vivado/2025.2/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l xil_defaultlib -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l zynq_ultra_ps_e_vip_v1_0_22 -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 \
"../../../../matmul_accelerator.gen/sources_1/bd/system/ipshared/3051/hdl/sc_si_converter_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../matmul_accelerator.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../matmul_accelerator.gen/sources_1/bd/system/ipshared/a0fe/hdl" "+incdir+../../../../matmul_accelerator.gen/sources_1/bd/system/ipshared/f0b6/hdl/verilog" "+incdir+../../../../matmul_accelerator.gen/sources_1/bd/system/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../Apps/Study/Vivado/2025.2/Vivado/data/rsb/busdef" "+incdir+D:/Apps/Study/Vivado/2025.2/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l xil_defaultlib -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l zynq_ultra_ps_e_vip_v1_0_22 -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 \
"../../../bd/system/ip/system_axi_smc_0/bd_0/ip/ip_19/sim/bd_44e3_s00sic_0.sv" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../matmul_accelerator.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../matmul_accelerator.gen/sources_1/bd/system/ipshared/a0fe/hdl" "+incdir+../../../../matmul_accelerator.gen/sources_1/bd/system/ipshared/f0b6/hdl/verilog" "+incdir+../../../../matmul_accelerator.gen/sources_1/bd/system/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../Apps/Study/Vivado/2025.2/Vivado/data/rsb/busdef" "+incdir+D:/Apps/Study/Vivado/2025.2/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l xil_defaultlib -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l zynq_ultra_ps_e_vip_v1_0_22 -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 \
"../../../../matmul_accelerator.gen/sources_1/bd/system/ipshared/852f/hdl/sc_axi2sc_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../matmul_accelerator.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../matmul_accelerator.gen/sources_1/bd/system/ipshared/a0fe/hdl" "+incdir+../../../../matmul_accelerator.gen/sources_1/bd/system/ipshared/f0b6/hdl/verilog" "+incdir+../../../../matmul_accelerator.gen/sources_1/bd/system/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../Apps/Study/Vivado/2025.2/Vivado/data/rsb/busdef" "+incdir+D:/Apps/Study/Vivado/2025.2/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l xil_defaultlib -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l zynq_ultra_ps_e_vip_v1_0_22 -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 \
"../../../bd/system/ip/system_axi_smc_0/bd_0/ip/ip_20/sim/bd_44e3_s00a2s_0.sv" \
"../../../bd/system/ip/system_axi_smc_0/bd_0/ip/ip_21/sim/bd_44e3_sarn_0.sv" \
"../../../bd/system/ip/system_axi_smc_0/bd_0/ip/ip_22/sim/bd_44e3_srn_0.sv" \
"../../../bd/system/ip/system_axi_smc_0/bd_0/ip/ip_23/sim/bd_44e3_sawn_0.sv" \
"../../../bd/system/ip/system_axi_smc_0/bd_0/ip/ip_24/sim/bd_44e3_swn_0.sv" \
"../../../bd/system/ip/system_axi_smc_0/bd_0/ip/ip_25/sim/bd_44e3_sbn_0.sv" \
"../../../bd/system/ip/system_axi_smc_0/bd_0/ip/ip_26/sim/bd_44e3_s01mmu_0.sv" \
"../../../bd/system/ip/system_axi_smc_0/bd_0/ip/ip_27/sim/bd_44e3_s01tr_0.sv" \
"../../../bd/system/ip/system_axi_smc_0/bd_0/ip/ip_28/sim/bd_44e3_s01sic_0.sv" \
"../../../bd/system/ip/system_axi_smc_0/bd_0/ip/ip_29/sim/bd_44e3_s01a2s_0.sv" \
"../../../bd/system/ip/system_axi_smc_0/bd_0/ip/ip_30/sim/bd_44e3_sarn_1.sv" \
"../../../bd/system/ip/system_axi_smc_0/bd_0/ip/ip_31/sim/bd_44e3_srn_1.sv" \
"../../../bd/system/ip/system_axi_smc_0/bd_0/ip/ip_32/sim/bd_44e3_sawn_1.sv" \
"../../../bd/system/ip/system_axi_smc_0/bd_0/ip/ip_33/sim/bd_44e3_swn_1.sv" \
"../../../bd/system/ip/system_axi_smc_0/bd_0/ip/ip_34/sim/bd_44e3_sbn_1.sv" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../matmul_accelerator.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../matmul_accelerator.gen/sources_1/bd/system/ipshared/a0fe/hdl" "+incdir+../../../../matmul_accelerator.gen/sources_1/bd/system/ipshared/f0b6/hdl/verilog" "+incdir+../../../../matmul_accelerator.gen/sources_1/bd/system/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../Apps/Study/Vivado/2025.2/Vivado/data/rsb/busdef" "+incdir+D:/Apps/Study/Vivado/2025.2/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l xil_defaultlib -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l zynq_ultra_ps_e_vip_v1_0_22 -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 \
"../../../../matmul_accelerator.gen/sources_1/bd/system/ipshared/fca9/hdl/sc_sc2axi_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../matmul_accelerator.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../matmul_accelerator.gen/sources_1/bd/system/ipshared/a0fe/hdl" "+incdir+../../../../matmul_accelerator.gen/sources_1/bd/system/ipshared/f0b6/hdl/verilog" "+incdir+../../../../matmul_accelerator.gen/sources_1/bd/system/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../Apps/Study/Vivado/2025.2/Vivado/data/rsb/busdef" "+incdir+D:/Apps/Study/Vivado/2025.2/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l xil_defaultlib -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l zynq_ultra_ps_e_vip_v1_0_22 -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 \
"../../../bd/system/ip/system_axi_smc_0/bd_0/ip/ip_35/sim/bd_44e3_m00s2a_0.sv" \
"../../../bd/system/ip/system_axi_smc_0/bd_0/ip/ip_36/sim/bd_44e3_m00arn_0.sv" \
"../../../bd/system/ip/system_axi_smc_0/bd_0/ip/ip_37/sim/bd_44e3_m00rn_0.sv" \
"../../../bd/system/ip/system_axi_smc_0/bd_0/ip/ip_38/sim/bd_44e3_m00awn_0.sv" \
"../../../bd/system/ip/system_axi_smc_0/bd_0/ip/ip_39/sim/bd_44e3_m00wn_0.sv" \
"../../../bd/system/ip/system_axi_smc_0/bd_0/ip/ip_40/sim/bd_44e3_m00bn_0.sv" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../matmul_accelerator.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../matmul_accelerator.gen/sources_1/bd/system/ipshared/a0fe/hdl" "+incdir+../../../../matmul_accelerator.gen/sources_1/bd/system/ipshared/f0b6/hdl/verilog" "+incdir+../../../../matmul_accelerator.gen/sources_1/bd/system/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../Apps/Study/Vivado/2025.2/Vivado/data/rsb/busdef" "+incdir+D:/Apps/Study/Vivado/2025.2/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l xil_defaultlib -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l zynq_ultra_ps_e_vip_v1_0_22 -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 \
"../../../../matmul_accelerator.gen/sources_1/bd/system/ipshared/e44a/hdl/sc_exit_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../matmul_accelerator.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../matmul_accelerator.gen/sources_1/bd/system/ipshared/a0fe/hdl" "+incdir+../../../../matmul_accelerator.gen/sources_1/bd/system/ipshared/f0b6/hdl/verilog" "+incdir+../../../../matmul_accelerator.gen/sources_1/bd/system/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../Apps/Study/Vivado/2025.2/Vivado/data/rsb/busdef" "+incdir+D:/Apps/Study/Vivado/2025.2/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l xil_defaultlib -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l zynq_ultra_ps_e_vip_v1_0_22 -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 \
"../../../bd/system/ip/system_axi_smc_0/bd_0/ip/ip_41/sim/bd_44e3_m00e_0.sv" \

vcom -work smartconnect_v1_0 -93  \
"../../../../matmul_accelerator.gen/sources_1/bd/system/ipshared/cb42/hdl/sc_ultralite_v1_0_rfs.vhd" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../matmul_accelerator.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../matmul_accelerator.gen/sources_1/bd/system/ipshared/a0fe/hdl" "+incdir+../../../../matmul_accelerator.gen/sources_1/bd/system/ipshared/f0b6/hdl/verilog" "+incdir+../../../../matmul_accelerator.gen/sources_1/bd/system/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../Apps/Study/Vivado/2025.2/Vivado/data/rsb/busdef" "+incdir+D:/Apps/Study/Vivado/2025.2/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l xil_defaultlib -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l zynq_ultra_ps_e_vip_v1_0_22 -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 \
"../../../../matmul_accelerator.gen/sources_1/bd/system/ipshared/cb42/hdl/sc_ultralite_v1_0_rfs.sv" \

vlog -work axi_register_slice_v2_1_36  -v2k5 "+incdir+../../../../matmul_accelerator.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../matmul_accelerator.gen/sources_1/bd/system/ipshared/a0fe/hdl" "+incdir+../../../../matmul_accelerator.gen/sources_1/bd/system/ipshared/f0b6/hdl/verilog" "+incdir+../../../../matmul_accelerator.gen/sources_1/bd/system/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../Apps/Study/Vivado/2025.2/Vivado/data/rsb/busdef" "+incdir+D:/Apps/Study/Vivado/2025.2/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l xil_defaultlib -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l zynq_ultra_ps_e_vip_v1_0_22 -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 \
"../../../../matmul_accelerator.gen/sources_1/bd/system/ipshared/bc4b/hdl/axi_register_slice_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../matmul_accelerator.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../matmul_accelerator.gen/sources_1/bd/system/ipshared/a0fe/hdl" "+incdir+../../../../matmul_accelerator.gen/sources_1/bd/system/ipshared/f0b6/hdl/verilog" "+incdir+../../../../matmul_accelerator.gen/sources_1/bd/system/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../Apps/Study/Vivado/2025.2/Vivado/data/rsb/busdef" "+incdir+D:/Apps/Study/Vivado/2025.2/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l xil_defaultlib -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l zynq_ultra_ps_e_vip_v1_0_22 -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 \
"../../../bd/system/ip/system_axi_smc_0/sim/system_axi_smc_0.sv" \

vcom -work xil_defaultlib -93  \
"../../../bd/system/ip/system_rst_ps8_0_99M_0/sim/system_rst_ps8_0_99M_0.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../matmul_accelerator.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../matmul_accelerator.gen/sources_1/bd/system/ipshared/a0fe/hdl" "+incdir+../../../../matmul_accelerator.gen/sources_1/bd/system/ipshared/f0b6/hdl/verilog" "+incdir+../../../../matmul_accelerator.gen/sources_1/bd/system/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../Apps/Study/Vivado/2025.2/Vivado/data/rsb/busdef" "+incdir+D:/Apps/Study/Vivado/2025.2/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l xil_defaultlib -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l zynq_ultra_ps_e_vip_v1_0_22 -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 \
"../../../bd/system/sim/system.v" \

vlog -work xil_defaultlib \
"glbl.v"

