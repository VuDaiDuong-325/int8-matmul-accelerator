#!/bin/bash

# 
# Vivado(TM)
# runme.sh: a Vivado-generated Runs Script for UNIX
# Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
# Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
# 

echo "This script was generated under a different operating system."
echo "Please update the PATH and LD_LIBRARY_PATH variables below, before executing this script"
exit

if [ -z "$PATH" ]; then
  PATH=E:/vivado/2025.2/Vitis/bin;E:/vivado/2025.2/Vivado/ids_lite/ISE/bin/nt64;E:/vivado/2025.2/Vivado/ids_lite/ISE/lib/nt64:E:/vivado/2025.2/Vivado/bin
else
  PATH=E:/vivado/2025.2/Vitis/bin;E:/vivado/2025.2/Vivado/ids_lite/ISE/bin/nt64;E:/vivado/2025.2/Vivado/ids_lite/ISE/lib/nt64:E:/vivado/2025.2/Vivado/bin:$PATH
fi
export PATH

if [ -z "$LD_LIBRARY_PATH" ]; then
  LD_LIBRARY_PATH=
else
  LD_LIBRARY_PATH=:$LD_LIBRARY_PATH
fi
export LD_LIBRARY_PATH

HD_PWD='D:/E/1subject/HK6/doan1/int8-matmul-accelerator/gemm_accelerator/gemm_accelerator.runs/gemm_system_gemm_top_l2_0_0_synth_1'
cd "$HD_PWD"

HD_LOG=runme.log
/bin/touch $HD_LOG

ISEStep="./ISEWrap.sh"
EAStep()
{
     $ISEStep $HD_LOG "$@" >> $HD_LOG 2>&1
     if [ $? -ne 0 ]
     then
         exit
     fi
}

EAStep vivado -log gemm_system_gemm_top_l2_0_0.vds -m64 -product Vivado -mode batch -messageDb vivado.pb -notrace -source gemm_system_gemm_top_l2_0_0.tcl
