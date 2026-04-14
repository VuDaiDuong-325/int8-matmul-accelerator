transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

vlib work
vlib activehdl/xilinx_vip
vlib activehdl/xpm
vlib activehdl/fifo_generator_v13_2_14
vlib activehdl/xil_defaultlib

vmap xilinx_vip activehdl/xilinx_vip
vmap xpm activehdl/xpm
vmap fifo_generator_v13_2_14 activehdl/fifo_generator_v13_2_14
vmap xil_defaultlib activehdl/xil_defaultlib

vlog -work xilinx_vip  -sv2k12 "+incdir+E:/vivado/2025.2/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l fifo_generator_v13_2_14 -l xil_defaultlib \
"E:/vivado/2025.2/Vivado/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
"E:/vivado/2025.2/Vivado/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
"E:/vivado/2025.2/Vivado/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
"E:/vivado/2025.2/Vivado/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
"E:/vivado/2025.2/Vivado/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
"E:/vivado/2025.2/Vivado/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
"E:/vivado/2025.2/Vivado/data/xilinx_vip/hdl/axi_vip_if.sv" \
"E:/vivado/2025.2/Vivado/data/xilinx_vip/hdl/clk_vip_if.sv" \
"E:/vivado/2025.2/Vivado/data/xilinx_vip/hdl/rst_vip_if.sv" \

vlog -work xpm  -sv2k12 "+incdir+E:/vivado/2025.2/Vivado/data/rsb/busdef" "+incdir+E:/vivado/2025.2/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l fifo_generator_v13_2_14 -l xil_defaultlib \
"E:/vivado/2025.2/Vivado/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"E:/vivado/2025.2/Vivado/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
"E:/vivado/2025.2/Vivado/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93  \
"E:/vivado/2025.2/Vivado/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work fifo_generator_v13_2_14  -v2k5 "+incdir+E:/vivado/2025.2/Vivado/data/rsb/busdef" "+incdir+E:/vivado/2025.2/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l fifo_generator_v13_2_14 -l xil_defaultlib \
"../../../ipstatic/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_14 -93  \
"../../../ipstatic/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_14  -v2k5 "+incdir+E:/vivado/2025.2/Vivado/data/rsb/busdef" "+incdir+E:/vivado/2025.2/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l fifo_generator_v13_2_14 -l xil_defaultlib \
"../../../ipstatic/hdl/fifo_generator_v13_2_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+E:/vivado/2025.2/Vivado/data/rsb/busdef" "+incdir+E:/vivado/2025.2/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l fifo_generator_v13_2_14 -l xil_defaultlib \
"../../../../matmul.gen/sources_1/ip/fifo_512_to_128/sim/fifo_512_to_128.v" \

vlog -work xil_defaultlib \
"glbl.v"

