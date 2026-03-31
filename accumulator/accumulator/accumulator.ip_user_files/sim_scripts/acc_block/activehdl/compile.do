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
vlib activehdl/xlslice_v1_0_5
vlib activehdl/axi_lite_ipif_v3_0_4
vlib activehdl/interrupt_control_v3_1_5
vlib activehdl/axi_gpio_v2_0_37
vlib activehdl/proc_sys_reset_v5_0_17
vlib activehdl/smartconnect_v1_0
vlib activehdl/axi_register_slice_v2_1_36

vmap xilinx_vip activehdl/xilinx_vip
vmap xpm activehdl/xpm
vmap xil_defaultlib activehdl/xil_defaultlib
vmap axi_infrastructure_v1_1_0 activehdl/axi_infrastructure_v1_1_0
vmap axi_vip_v1_1_22 activehdl/axi_vip_v1_1_22
vmap zynq_ultra_ps_e_vip_v1_0_22 activehdl/zynq_ultra_ps_e_vip_v1_0_22
vmap xlslice_v1_0_5 activehdl/xlslice_v1_0_5
vmap axi_lite_ipif_v3_0_4 activehdl/axi_lite_ipif_v3_0_4
vmap interrupt_control_v3_1_5 activehdl/interrupt_control_v3_1_5
vmap axi_gpio_v2_0_37 activehdl/axi_gpio_v2_0_37
vmap proc_sys_reset_v5_0_17 activehdl/proc_sys_reset_v5_0_17
vmap smartconnect_v1_0 activehdl/smartconnect_v1_0
vmap axi_register_slice_v2_1_36 activehdl/axi_register_slice_v2_1_36

vlog -work xilinx_vip  -sv2k12 "+incdir+D:/Apps/Study/Vivado/2025.2/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l xil_defaultlib -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l zynq_ultra_ps_e_vip_v1_0_22 -l xlslice_v1_0_5 -l axi_lite_ipif_v3_0_4 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_37 -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 \
"D:/Apps/Study/Vivado/2025.2/Vivado/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
"D:/Apps/Study/Vivado/2025.2/Vivado/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
"D:/Apps/Study/Vivado/2025.2/Vivado/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
"D:/Apps/Study/Vivado/2025.2/Vivado/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
"D:/Apps/Study/Vivado/2025.2/Vivado/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
"D:/Apps/Study/Vivado/2025.2/Vivado/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
"D:/Apps/Study/Vivado/2025.2/Vivado/data/xilinx_vip/hdl/axi_vip_if.sv" \
"D:/Apps/Study/Vivado/2025.2/Vivado/data/xilinx_vip/hdl/clk_vip_if.sv" \
"D:/Apps/Study/Vivado/2025.2/Vivado/data/xilinx_vip/hdl/rst_vip_if.sv" \

vlog -work xpm  -sv2k12 "+incdir+../../../../accumulator.gen/sources_1/bd/acc_block/ipshared/ec67/hdl" "+incdir+../../../../accumulator.gen/sources_1/bd/acc_block/ipshared/a0fe/hdl" "+incdir+../../../../accumulator.gen/sources_1/bd/acc_block/ipshared/f0b6/hdl/verilog" "+incdir+../../../../accumulator.gen/sources_1/bd/acc_block/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../../../Apps/Study/Vivado/2025.2/Vivado/data/rsb/busdef" "+incdir+D:/Apps/Study/Vivado/2025.2/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l xil_defaultlib -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l zynq_ultra_ps_e_vip_v1_0_22 -l xlslice_v1_0_5 -l axi_lite_ipif_v3_0_4 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_37 -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 \
"D:/Apps/Study/Vivado/2025.2/Vivado/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"D:/Apps/Study/Vivado/2025.2/Vivado/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
"D:/Apps/Study/Vivado/2025.2/Vivado/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93  \
"D:/Apps/Study/Vivado/2025.2/Vivado/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../accumulator.gen/sources_1/bd/acc_block/ipshared/ec67/hdl" "+incdir+../../../../accumulator.gen/sources_1/bd/acc_block/ipshared/a0fe/hdl" "+incdir+../../../../accumulator.gen/sources_1/bd/acc_block/ipshared/f0b6/hdl/verilog" "+incdir+../../../../accumulator.gen/sources_1/bd/acc_block/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../../../Apps/Study/Vivado/2025.2/Vivado/data/rsb/busdef" "+incdir+D:/Apps/Study/Vivado/2025.2/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l xil_defaultlib -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l zynq_ultra_ps_e_vip_v1_0_22 -l xlslice_v1_0_5 -l axi_lite_ipif_v3_0_4 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_37 -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 \
"../../../bd/acc_block/ip/acc_block_acc_reg_0_0/sim/acc_block_acc_reg_0_0.v" \

vlog -work axi_infrastructure_v1_1_0  -v2k5 "+incdir+../../../../accumulator.gen/sources_1/bd/acc_block/ipshared/ec67/hdl" "+incdir+../../../../accumulator.gen/sources_1/bd/acc_block/ipshared/a0fe/hdl" "+incdir+../../../../accumulator.gen/sources_1/bd/acc_block/ipshared/f0b6/hdl/verilog" "+incdir+../../../../accumulator.gen/sources_1/bd/acc_block/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../../../Apps/Study/Vivado/2025.2/Vivado/data/rsb/busdef" "+incdir+D:/Apps/Study/Vivado/2025.2/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l xil_defaultlib -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l zynq_ultra_ps_e_vip_v1_0_22 -l xlslice_v1_0_5 -l axi_lite_ipif_v3_0_4 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_37 -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 \
"../../../../accumulator.gen/sources_1/bd/acc_block/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work axi_vip_v1_1_22  -sv2k12 "+incdir+../../../../accumulator.gen/sources_1/bd/acc_block/ipshared/ec67/hdl" "+incdir+../../../../accumulator.gen/sources_1/bd/acc_block/ipshared/a0fe/hdl" "+incdir+../../../../accumulator.gen/sources_1/bd/acc_block/ipshared/f0b6/hdl/verilog" "+incdir+../../../../accumulator.gen/sources_1/bd/acc_block/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../../../Apps/Study/Vivado/2025.2/Vivado/data/rsb/busdef" "+incdir+D:/Apps/Study/Vivado/2025.2/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l xil_defaultlib -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l zynq_ultra_ps_e_vip_v1_0_22 -l xlslice_v1_0_5 -l axi_lite_ipif_v3_0_4 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_37 -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 \
"../../../../accumulator.gen/sources_1/bd/acc_block/ipshared/b16a/hdl/axi_vip_v1_1_vl_rfs.sv" \

vlog -work zynq_ultra_ps_e_vip_v1_0_22  -sv2k12 "+incdir+../../../../accumulator.gen/sources_1/bd/acc_block/ipshared/ec67/hdl" "+incdir+../../../../accumulator.gen/sources_1/bd/acc_block/ipshared/a0fe/hdl" "+incdir+../../../../accumulator.gen/sources_1/bd/acc_block/ipshared/f0b6/hdl/verilog" "+incdir+../../../../accumulator.gen/sources_1/bd/acc_block/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../../../Apps/Study/Vivado/2025.2/Vivado/data/rsb/busdef" "+incdir+D:/Apps/Study/Vivado/2025.2/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l xil_defaultlib -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l zynq_ultra_ps_e_vip_v1_0_22 -l xlslice_v1_0_5 -l axi_lite_ipif_v3_0_4 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_37 -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 \
"../../../../accumulator.gen/sources_1/bd/acc_block/ipshared/a0fe/hdl/zynq_ultra_ps_e_vip_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../accumulator.gen/sources_1/bd/acc_block/ipshared/ec67/hdl" "+incdir+../../../../accumulator.gen/sources_1/bd/acc_block/ipshared/a0fe/hdl" "+incdir+../../../../accumulator.gen/sources_1/bd/acc_block/ipshared/f0b6/hdl/verilog" "+incdir+../../../../accumulator.gen/sources_1/bd/acc_block/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../../../Apps/Study/Vivado/2025.2/Vivado/data/rsb/busdef" "+incdir+D:/Apps/Study/Vivado/2025.2/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l xil_defaultlib -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l zynq_ultra_ps_e_vip_v1_0_22 -l xlslice_v1_0_5 -l axi_lite_ipif_v3_0_4 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_37 -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 \
"../../../bd/acc_block/ip/acc_block_zynq_ultra_ps_e_0_0/sim/acc_block_zynq_ultra_ps_e_0_0_vip_wrapper.v" \

vlog -work xlslice_v1_0_5  -v2k5 "+incdir+../../../../accumulator.gen/sources_1/bd/acc_block/ipshared/ec67/hdl" "+incdir+../../../../accumulator.gen/sources_1/bd/acc_block/ipshared/a0fe/hdl" "+incdir+../../../../accumulator.gen/sources_1/bd/acc_block/ipshared/f0b6/hdl/verilog" "+incdir+../../../../accumulator.gen/sources_1/bd/acc_block/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../../../Apps/Study/Vivado/2025.2/Vivado/data/rsb/busdef" "+incdir+D:/Apps/Study/Vivado/2025.2/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l xil_defaultlib -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l zynq_ultra_ps_e_vip_v1_0_22 -l xlslice_v1_0_5 -l axi_lite_ipif_v3_0_4 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_37 -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 \
"../../../../accumulator.gen/sources_1/bd/acc_block/ipshared/6792/hdl/xlslice_v1_0_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../accumulator.gen/sources_1/bd/acc_block/ipshared/ec67/hdl" "+incdir+../../../../accumulator.gen/sources_1/bd/acc_block/ipshared/a0fe/hdl" "+incdir+../../../../accumulator.gen/sources_1/bd/acc_block/ipshared/f0b6/hdl/verilog" "+incdir+../../../../accumulator.gen/sources_1/bd/acc_block/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../../../Apps/Study/Vivado/2025.2/Vivado/data/rsb/busdef" "+incdir+D:/Apps/Study/Vivado/2025.2/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l xil_defaultlib -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l zynq_ultra_ps_e_vip_v1_0_22 -l xlslice_v1_0_5 -l axi_lite_ipif_v3_0_4 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_37 -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 \
"../../../bd/acc_block/ip/acc_block_xlslice_0_0/sim/acc_block_xlslice_0_0.v" \
"../../../bd/acc_block/ip/acc_block_xlslice_1_0/sim/acc_block_xlslice_1_0.v" \
"../../../bd/acc_block/ip/acc_block_xlslice_2_0/sim/acc_block_xlslice_2_0.v" \

vcom -work axi_lite_ipif_v3_0_4 -93  \
"../../../../accumulator.gen/sources_1/bd/acc_block/ipshared/66ea/hdl/axi_lite_ipif_v3_0_vh_rfs.vhd" \

vcom -work interrupt_control_v3_1_5 -93  \
"../../../../accumulator.gen/sources_1/bd/acc_block/ipshared/d8cc/hdl/interrupt_control_v3_1_vh_rfs.vhd" \

vcom -work axi_gpio_v2_0_37 -93  \
"../../../../accumulator.gen/sources_1/bd/acc_block/ipshared/0271/hdl/axi_gpio_v2_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93  \
"../../../bd/acc_block/ip/acc_block_axi_gpio_0_0/sim/acc_block_axi_gpio_0_0.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../accumulator.gen/sources_1/bd/acc_block/ipshared/ec67/hdl" "+incdir+../../../../accumulator.gen/sources_1/bd/acc_block/ipshared/a0fe/hdl" "+incdir+../../../../accumulator.gen/sources_1/bd/acc_block/ipshared/f0b6/hdl/verilog" "+incdir+../../../../accumulator.gen/sources_1/bd/acc_block/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../../../Apps/Study/Vivado/2025.2/Vivado/data/rsb/busdef" "+incdir+D:/Apps/Study/Vivado/2025.2/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l xil_defaultlib -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l zynq_ultra_ps_e_vip_v1_0_22 -l xlslice_v1_0_5 -l axi_lite_ipif_v3_0_4 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_37 -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 \
"../../../bd/acc_block/ip/acc_block_axi_smc_0/bd_0/sim/bd_961d.v" \

vcom -work proc_sys_reset_v5_0_17 -93  \
"../../../../accumulator.gen/sources_1/bd/acc_block/ipshared/9438/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93  \
"../../../bd/acc_block/ip/acc_block_axi_smc_0/bd_0/ip/ip_1/sim/bd_961d_psr_aclk_0.vhd" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../accumulator.gen/sources_1/bd/acc_block/ipshared/ec67/hdl" "+incdir+../../../../accumulator.gen/sources_1/bd/acc_block/ipshared/a0fe/hdl" "+incdir+../../../../accumulator.gen/sources_1/bd/acc_block/ipshared/f0b6/hdl/verilog" "+incdir+../../../../accumulator.gen/sources_1/bd/acc_block/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../../../Apps/Study/Vivado/2025.2/Vivado/data/rsb/busdef" "+incdir+D:/Apps/Study/Vivado/2025.2/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l xil_defaultlib -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l zynq_ultra_ps_e_vip_v1_0_22 -l xlslice_v1_0_5 -l axi_lite_ipif_v3_0_4 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_37 -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 \
"../../../../accumulator.gen/sources_1/bd/acc_block/ipshared/f0b6/hdl/sc_util_v1_0_vl_rfs.sv" \
"../../../../accumulator.gen/sources_1/bd/acc_block/ipshared/0848/hdl/sc_switchboard_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../accumulator.gen/sources_1/bd/acc_block/ipshared/ec67/hdl" "+incdir+../../../../accumulator.gen/sources_1/bd/acc_block/ipshared/a0fe/hdl" "+incdir+../../../../accumulator.gen/sources_1/bd/acc_block/ipshared/f0b6/hdl/verilog" "+incdir+../../../../accumulator.gen/sources_1/bd/acc_block/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../../../Apps/Study/Vivado/2025.2/Vivado/data/rsb/busdef" "+incdir+D:/Apps/Study/Vivado/2025.2/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l xil_defaultlib -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l zynq_ultra_ps_e_vip_v1_0_22 -l xlslice_v1_0_5 -l axi_lite_ipif_v3_0_4 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_37 -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 \
"../../../bd/acc_block/ip/acc_block_axi_smc_0/bd_0/ip/ip_2/sim/bd_961d_arinsw_0.sv" \
"../../../bd/acc_block/ip/acc_block_axi_smc_0/bd_0/ip/ip_3/sim/bd_961d_rinsw_0.sv" \
"../../../bd/acc_block/ip/acc_block_axi_smc_0/bd_0/ip/ip_4/sim/bd_961d_awinsw_0.sv" \
"../../../bd/acc_block/ip/acc_block_axi_smc_0/bd_0/ip/ip_5/sim/bd_961d_winsw_0.sv" \
"../../../bd/acc_block/ip/acc_block_axi_smc_0/bd_0/ip/ip_6/sim/bd_961d_binsw_0.sv" \
"../../../bd/acc_block/ip/acc_block_axi_smc_0/bd_0/ip/ip_7/sim/bd_961d_aroutsw_0.sv" \
"../../../bd/acc_block/ip/acc_block_axi_smc_0/bd_0/ip/ip_8/sim/bd_961d_routsw_0.sv" \
"../../../bd/acc_block/ip/acc_block_axi_smc_0/bd_0/ip/ip_9/sim/bd_961d_awoutsw_0.sv" \
"../../../bd/acc_block/ip/acc_block_axi_smc_0/bd_0/ip/ip_10/sim/bd_961d_woutsw_0.sv" \
"../../../bd/acc_block/ip/acc_block_axi_smc_0/bd_0/ip/ip_11/sim/bd_961d_boutsw_0.sv" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../accumulator.gen/sources_1/bd/acc_block/ipshared/ec67/hdl" "+incdir+../../../../accumulator.gen/sources_1/bd/acc_block/ipshared/a0fe/hdl" "+incdir+../../../../accumulator.gen/sources_1/bd/acc_block/ipshared/f0b6/hdl/verilog" "+incdir+../../../../accumulator.gen/sources_1/bd/acc_block/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../../../Apps/Study/Vivado/2025.2/Vivado/data/rsb/busdef" "+incdir+D:/Apps/Study/Vivado/2025.2/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l xil_defaultlib -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l zynq_ultra_ps_e_vip_v1_0_22 -l xlslice_v1_0_5 -l axi_lite_ipif_v3_0_4 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_37 -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 \
"../../../../accumulator.gen/sources_1/bd/acc_block/ipshared/00fe/hdl/sc_node_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../accumulator.gen/sources_1/bd/acc_block/ipshared/ec67/hdl" "+incdir+../../../../accumulator.gen/sources_1/bd/acc_block/ipshared/a0fe/hdl" "+incdir+../../../../accumulator.gen/sources_1/bd/acc_block/ipshared/f0b6/hdl/verilog" "+incdir+../../../../accumulator.gen/sources_1/bd/acc_block/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../../../Apps/Study/Vivado/2025.2/Vivado/data/rsb/busdef" "+incdir+D:/Apps/Study/Vivado/2025.2/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l xil_defaultlib -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l zynq_ultra_ps_e_vip_v1_0_22 -l xlslice_v1_0_5 -l axi_lite_ipif_v3_0_4 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_37 -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 \
"../../../bd/acc_block/ip/acc_block_axi_smc_0/bd_0/ip/ip_12/sim/bd_961d_arni_0.sv" \
"../../../bd/acc_block/ip/acc_block_axi_smc_0/bd_0/ip/ip_13/sim/bd_961d_rni_0.sv" \
"../../../bd/acc_block/ip/acc_block_axi_smc_0/bd_0/ip/ip_14/sim/bd_961d_awni_0.sv" \
"../../../bd/acc_block/ip/acc_block_axi_smc_0/bd_0/ip/ip_15/sim/bd_961d_wni_0.sv" \
"../../../bd/acc_block/ip/acc_block_axi_smc_0/bd_0/ip/ip_16/sim/bd_961d_bni_0.sv" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../accumulator.gen/sources_1/bd/acc_block/ipshared/ec67/hdl" "+incdir+../../../../accumulator.gen/sources_1/bd/acc_block/ipshared/a0fe/hdl" "+incdir+../../../../accumulator.gen/sources_1/bd/acc_block/ipshared/f0b6/hdl/verilog" "+incdir+../../../../accumulator.gen/sources_1/bd/acc_block/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../../../Apps/Study/Vivado/2025.2/Vivado/data/rsb/busdef" "+incdir+D:/Apps/Study/Vivado/2025.2/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l xil_defaultlib -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l zynq_ultra_ps_e_vip_v1_0_22 -l xlslice_v1_0_5 -l axi_lite_ipif_v3_0_4 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_37 -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 \
"../../../../accumulator.gen/sources_1/bd/acc_block/ipshared/3d9a/hdl/sc_mmu_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../accumulator.gen/sources_1/bd/acc_block/ipshared/ec67/hdl" "+incdir+../../../../accumulator.gen/sources_1/bd/acc_block/ipshared/a0fe/hdl" "+incdir+../../../../accumulator.gen/sources_1/bd/acc_block/ipshared/f0b6/hdl/verilog" "+incdir+../../../../accumulator.gen/sources_1/bd/acc_block/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../../../Apps/Study/Vivado/2025.2/Vivado/data/rsb/busdef" "+incdir+D:/Apps/Study/Vivado/2025.2/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l xil_defaultlib -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l zynq_ultra_ps_e_vip_v1_0_22 -l xlslice_v1_0_5 -l axi_lite_ipif_v3_0_4 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_37 -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 \
"../../../bd/acc_block/ip/acc_block_axi_smc_0/bd_0/ip/ip_17/sim/bd_961d_s00mmu_0.sv" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../accumulator.gen/sources_1/bd/acc_block/ipshared/ec67/hdl" "+incdir+../../../../accumulator.gen/sources_1/bd/acc_block/ipshared/a0fe/hdl" "+incdir+../../../../accumulator.gen/sources_1/bd/acc_block/ipshared/f0b6/hdl/verilog" "+incdir+../../../../accumulator.gen/sources_1/bd/acc_block/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../../../Apps/Study/Vivado/2025.2/Vivado/data/rsb/busdef" "+incdir+D:/Apps/Study/Vivado/2025.2/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l xil_defaultlib -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l zynq_ultra_ps_e_vip_v1_0_22 -l xlslice_v1_0_5 -l axi_lite_ipif_v3_0_4 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_37 -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 \
"../../../../accumulator.gen/sources_1/bd/acc_block/ipshared/7785/hdl/sc_transaction_regulator_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../accumulator.gen/sources_1/bd/acc_block/ipshared/ec67/hdl" "+incdir+../../../../accumulator.gen/sources_1/bd/acc_block/ipshared/a0fe/hdl" "+incdir+../../../../accumulator.gen/sources_1/bd/acc_block/ipshared/f0b6/hdl/verilog" "+incdir+../../../../accumulator.gen/sources_1/bd/acc_block/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../../../Apps/Study/Vivado/2025.2/Vivado/data/rsb/busdef" "+incdir+D:/Apps/Study/Vivado/2025.2/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l xil_defaultlib -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l zynq_ultra_ps_e_vip_v1_0_22 -l xlslice_v1_0_5 -l axi_lite_ipif_v3_0_4 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_37 -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 \
"../../../bd/acc_block/ip/acc_block_axi_smc_0/bd_0/ip/ip_18/sim/bd_961d_s00tr_0.sv" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../accumulator.gen/sources_1/bd/acc_block/ipshared/ec67/hdl" "+incdir+../../../../accumulator.gen/sources_1/bd/acc_block/ipshared/a0fe/hdl" "+incdir+../../../../accumulator.gen/sources_1/bd/acc_block/ipshared/f0b6/hdl/verilog" "+incdir+../../../../accumulator.gen/sources_1/bd/acc_block/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../../../Apps/Study/Vivado/2025.2/Vivado/data/rsb/busdef" "+incdir+D:/Apps/Study/Vivado/2025.2/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l xil_defaultlib -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l zynq_ultra_ps_e_vip_v1_0_22 -l xlslice_v1_0_5 -l axi_lite_ipif_v3_0_4 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_37 -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 \
"../../../../accumulator.gen/sources_1/bd/acc_block/ipshared/3051/hdl/sc_si_converter_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../accumulator.gen/sources_1/bd/acc_block/ipshared/ec67/hdl" "+incdir+../../../../accumulator.gen/sources_1/bd/acc_block/ipshared/a0fe/hdl" "+incdir+../../../../accumulator.gen/sources_1/bd/acc_block/ipshared/f0b6/hdl/verilog" "+incdir+../../../../accumulator.gen/sources_1/bd/acc_block/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../../../Apps/Study/Vivado/2025.2/Vivado/data/rsb/busdef" "+incdir+D:/Apps/Study/Vivado/2025.2/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l xil_defaultlib -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l zynq_ultra_ps_e_vip_v1_0_22 -l xlslice_v1_0_5 -l axi_lite_ipif_v3_0_4 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_37 -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 \
"../../../bd/acc_block/ip/acc_block_axi_smc_0/bd_0/ip/ip_19/sim/bd_961d_s00sic_0.sv" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../accumulator.gen/sources_1/bd/acc_block/ipshared/ec67/hdl" "+incdir+../../../../accumulator.gen/sources_1/bd/acc_block/ipshared/a0fe/hdl" "+incdir+../../../../accumulator.gen/sources_1/bd/acc_block/ipshared/f0b6/hdl/verilog" "+incdir+../../../../accumulator.gen/sources_1/bd/acc_block/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../../../Apps/Study/Vivado/2025.2/Vivado/data/rsb/busdef" "+incdir+D:/Apps/Study/Vivado/2025.2/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l xil_defaultlib -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l zynq_ultra_ps_e_vip_v1_0_22 -l xlslice_v1_0_5 -l axi_lite_ipif_v3_0_4 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_37 -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 \
"../../../../accumulator.gen/sources_1/bd/acc_block/ipshared/852f/hdl/sc_axi2sc_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../accumulator.gen/sources_1/bd/acc_block/ipshared/ec67/hdl" "+incdir+../../../../accumulator.gen/sources_1/bd/acc_block/ipshared/a0fe/hdl" "+incdir+../../../../accumulator.gen/sources_1/bd/acc_block/ipshared/f0b6/hdl/verilog" "+incdir+../../../../accumulator.gen/sources_1/bd/acc_block/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../../../Apps/Study/Vivado/2025.2/Vivado/data/rsb/busdef" "+incdir+D:/Apps/Study/Vivado/2025.2/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l xil_defaultlib -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l zynq_ultra_ps_e_vip_v1_0_22 -l xlslice_v1_0_5 -l axi_lite_ipif_v3_0_4 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_37 -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 \
"../../../bd/acc_block/ip/acc_block_axi_smc_0/bd_0/ip/ip_20/sim/bd_961d_s00a2s_0.sv" \
"../../../bd/acc_block/ip/acc_block_axi_smc_0/bd_0/ip/ip_21/sim/bd_961d_sarn_0.sv" \
"../../../bd/acc_block/ip/acc_block_axi_smc_0/bd_0/ip/ip_22/sim/bd_961d_srn_0.sv" \
"../../../bd/acc_block/ip/acc_block_axi_smc_0/bd_0/ip/ip_23/sim/bd_961d_sawn_0.sv" \
"../../../bd/acc_block/ip/acc_block_axi_smc_0/bd_0/ip/ip_24/sim/bd_961d_swn_0.sv" \
"../../../bd/acc_block/ip/acc_block_axi_smc_0/bd_0/ip/ip_25/sim/bd_961d_sbn_0.sv" \
"../../../bd/acc_block/ip/acc_block_axi_smc_0/bd_0/ip/ip_26/sim/bd_961d_s01mmu_0.sv" \
"../../../bd/acc_block/ip/acc_block_axi_smc_0/bd_0/ip/ip_27/sim/bd_961d_s01tr_0.sv" \
"../../../bd/acc_block/ip/acc_block_axi_smc_0/bd_0/ip/ip_28/sim/bd_961d_s01sic_0.sv" \
"../../../bd/acc_block/ip/acc_block_axi_smc_0/bd_0/ip/ip_29/sim/bd_961d_s01a2s_0.sv" \
"../../../bd/acc_block/ip/acc_block_axi_smc_0/bd_0/ip/ip_30/sim/bd_961d_sarn_1.sv" \
"../../../bd/acc_block/ip/acc_block_axi_smc_0/bd_0/ip/ip_31/sim/bd_961d_srn_1.sv" \
"../../../bd/acc_block/ip/acc_block_axi_smc_0/bd_0/ip/ip_32/sim/bd_961d_sawn_1.sv" \
"../../../bd/acc_block/ip/acc_block_axi_smc_0/bd_0/ip/ip_33/sim/bd_961d_swn_1.sv" \
"../../../bd/acc_block/ip/acc_block_axi_smc_0/bd_0/ip/ip_34/sim/bd_961d_sbn_1.sv" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../accumulator.gen/sources_1/bd/acc_block/ipshared/ec67/hdl" "+incdir+../../../../accumulator.gen/sources_1/bd/acc_block/ipshared/a0fe/hdl" "+incdir+../../../../accumulator.gen/sources_1/bd/acc_block/ipshared/f0b6/hdl/verilog" "+incdir+../../../../accumulator.gen/sources_1/bd/acc_block/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../../../Apps/Study/Vivado/2025.2/Vivado/data/rsb/busdef" "+incdir+D:/Apps/Study/Vivado/2025.2/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l xil_defaultlib -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l zynq_ultra_ps_e_vip_v1_0_22 -l xlslice_v1_0_5 -l axi_lite_ipif_v3_0_4 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_37 -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 \
"../../../../accumulator.gen/sources_1/bd/acc_block/ipshared/fca9/hdl/sc_sc2axi_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../accumulator.gen/sources_1/bd/acc_block/ipshared/ec67/hdl" "+incdir+../../../../accumulator.gen/sources_1/bd/acc_block/ipshared/a0fe/hdl" "+incdir+../../../../accumulator.gen/sources_1/bd/acc_block/ipshared/f0b6/hdl/verilog" "+incdir+../../../../accumulator.gen/sources_1/bd/acc_block/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../../../Apps/Study/Vivado/2025.2/Vivado/data/rsb/busdef" "+incdir+D:/Apps/Study/Vivado/2025.2/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l xil_defaultlib -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l zynq_ultra_ps_e_vip_v1_0_22 -l xlslice_v1_0_5 -l axi_lite_ipif_v3_0_4 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_37 -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 \
"../../../bd/acc_block/ip/acc_block_axi_smc_0/bd_0/ip/ip_35/sim/bd_961d_m00s2a_0.sv" \
"../../../bd/acc_block/ip/acc_block_axi_smc_0/bd_0/ip/ip_36/sim/bd_961d_m00arn_0.sv" \
"../../../bd/acc_block/ip/acc_block_axi_smc_0/bd_0/ip/ip_37/sim/bd_961d_m00rn_0.sv" \
"../../../bd/acc_block/ip/acc_block_axi_smc_0/bd_0/ip/ip_38/sim/bd_961d_m00awn_0.sv" \
"../../../bd/acc_block/ip/acc_block_axi_smc_0/bd_0/ip/ip_39/sim/bd_961d_m00wn_0.sv" \
"../../../bd/acc_block/ip/acc_block_axi_smc_0/bd_0/ip/ip_40/sim/bd_961d_m00bn_0.sv" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../accumulator.gen/sources_1/bd/acc_block/ipshared/ec67/hdl" "+incdir+../../../../accumulator.gen/sources_1/bd/acc_block/ipshared/a0fe/hdl" "+incdir+../../../../accumulator.gen/sources_1/bd/acc_block/ipshared/f0b6/hdl/verilog" "+incdir+../../../../accumulator.gen/sources_1/bd/acc_block/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../../../Apps/Study/Vivado/2025.2/Vivado/data/rsb/busdef" "+incdir+D:/Apps/Study/Vivado/2025.2/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l xil_defaultlib -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l zynq_ultra_ps_e_vip_v1_0_22 -l xlslice_v1_0_5 -l axi_lite_ipif_v3_0_4 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_37 -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 \
"../../../../accumulator.gen/sources_1/bd/acc_block/ipshared/e44a/hdl/sc_exit_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../accumulator.gen/sources_1/bd/acc_block/ipshared/ec67/hdl" "+incdir+../../../../accumulator.gen/sources_1/bd/acc_block/ipshared/a0fe/hdl" "+incdir+../../../../accumulator.gen/sources_1/bd/acc_block/ipshared/f0b6/hdl/verilog" "+incdir+../../../../accumulator.gen/sources_1/bd/acc_block/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../../../Apps/Study/Vivado/2025.2/Vivado/data/rsb/busdef" "+incdir+D:/Apps/Study/Vivado/2025.2/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l xil_defaultlib -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l zynq_ultra_ps_e_vip_v1_0_22 -l xlslice_v1_0_5 -l axi_lite_ipif_v3_0_4 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_37 -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 \
"../../../bd/acc_block/ip/acc_block_axi_smc_0/bd_0/ip/ip_41/sim/bd_961d_m00e_0.sv" \

vcom -work smartconnect_v1_0 -93  \
"../../../../accumulator.gen/sources_1/bd/acc_block/ipshared/cb42/hdl/sc_ultralite_v1_0_rfs.vhd" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../accumulator.gen/sources_1/bd/acc_block/ipshared/ec67/hdl" "+incdir+../../../../accumulator.gen/sources_1/bd/acc_block/ipshared/a0fe/hdl" "+incdir+../../../../accumulator.gen/sources_1/bd/acc_block/ipshared/f0b6/hdl/verilog" "+incdir+../../../../accumulator.gen/sources_1/bd/acc_block/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../../../Apps/Study/Vivado/2025.2/Vivado/data/rsb/busdef" "+incdir+D:/Apps/Study/Vivado/2025.2/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l xil_defaultlib -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l zynq_ultra_ps_e_vip_v1_0_22 -l xlslice_v1_0_5 -l axi_lite_ipif_v3_0_4 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_37 -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 \
"../../../../accumulator.gen/sources_1/bd/acc_block/ipshared/cb42/hdl/sc_ultralite_v1_0_rfs.sv" \

vlog -work axi_register_slice_v2_1_36  -v2k5 "+incdir+../../../../accumulator.gen/sources_1/bd/acc_block/ipshared/ec67/hdl" "+incdir+../../../../accumulator.gen/sources_1/bd/acc_block/ipshared/a0fe/hdl" "+incdir+../../../../accumulator.gen/sources_1/bd/acc_block/ipshared/f0b6/hdl/verilog" "+incdir+../../../../accumulator.gen/sources_1/bd/acc_block/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../../../Apps/Study/Vivado/2025.2/Vivado/data/rsb/busdef" "+incdir+D:/Apps/Study/Vivado/2025.2/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l xil_defaultlib -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l zynq_ultra_ps_e_vip_v1_0_22 -l xlslice_v1_0_5 -l axi_lite_ipif_v3_0_4 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_37 -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 \
"../../../../accumulator.gen/sources_1/bd/acc_block/ipshared/bc4b/hdl/axi_register_slice_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../accumulator.gen/sources_1/bd/acc_block/ipshared/ec67/hdl" "+incdir+../../../../accumulator.gen/sources_1/bd/acc_block/ipshared/a0fe/hdl" "+incdir+../../../../accumulator.gen/sources_1/bd/acc_block/ipshared/f0b6/hdl/verilog" "+incdir+../../../../accumulator.gen/sources_1/bd/acc_block/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../../../Apps/Study/Vivado/2025.2/Vivado/data/rsb/busdef" "+incdir+D:/Apps/Study/Vivado/2025.2/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l xil_defaultlib -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l zynq_ultra_ps_e_vip_v1_0_22 -l xlslice_v1_0_5 -l axi_lite_ipif_v3_0_4 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_37 -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 \
"../../../bd/acc_block/ip/acc_block_axi_smc_0/sim/acc_block_axi_smc_0.sv" \

vcom -work xil_defaultlib -93  \
"../../../bd/acc_block/ip/acc_block_rst_ps8_0_99M_0/sim/acc_block_rst_ps8_0_99M_0.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../accumulator.gen/sources_1/bd/acc_block/ipshared/ec67/hdl" "+incdir+../../../../accumulator.gen/sources_1/bd/acc_block/ipshared/a0fe/hdl" "+incdir+../../../../accumulator.gen/sources_1/bd/acc_block/ipshared/f0b6/hdl/verilog" "+incdir+../../../../accumulator.gen/sources_1/bd/acc_block/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../../../Apps/Study/Vivado/2025.2/Vivado/data/rsb/busdef" "+incdir+D:/Apps/Study/Vivado/2025.2/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l xil_defaultlib -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l zynq_ultra_ps_e_vip_v1_0_22 -l xlslice_v1_0_5 -l axi_lite_ipif_v3_0_4 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_37 -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 \
"../../../bd/acc_block/sim/acc_block.v" \

vlog -work xil_defaultlib \
"glbl.v"

