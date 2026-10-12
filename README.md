# INT8 GEMM Accelerator for Qwen2

An efficient hardware-accelerated solution designed to speed up the Inference of Large Language Models (LLMs), specifically the **Qwen2** series, on the AMD Kria KV260 Vision AI Starter Kit.

## Overview

General Matrix Multiplication (GEMM) dominates the computational workload of Transformer-based LLMs. This project implements a high-performance **INT8 GEMM Hardware Accelerator** using a $16 \times 16$ **Systolic Array** architecture implemented in the Programmable Logic (PL) of the Xilinx Zynq UltraScale+ MPSoC. 

To overcome on-chip memory constraints when handling massive LLM matrices, the system integrates a robust hardware-friendly **K-dimension Tiling** mechanism.

---

## Key Features

* **Systolic Array Core:** A high-throughput $16 \times 16$ PE (Processing Element) grid optimized for pipelined INT8 matrix operations.
* **Quantization & Rescale:** Built-in hardware Rescale pipeline (Round/Shift/Saturate) using the AbsMax symmetric quantization method to map FP32 weights/activations down to INT8.
* **Seamless HW/SW Co-design:** Driven by Python code via AXI DMA, handling software-side data alignment and scheduling. 
* **Tested Models:** Validated using actual matrix layouts extracted from the `q_proj` and `fc1` layers of the Qwen2 architecture.

---

## Performance & Accuracy Evaluation

* **Hardware Acceleration:** Significantly **faster** than the pure CPU ARM Cortex-A53 baseline, showing excellent scalability as matrix dimensions scale up.
* **Bit-True Precision:** Hardware outputs deliver a **100% Bit-True match** against the PyTorch golden reference model.
* **Quantization Quality:** Evaluation metrics (such as Cosine Similarity and SQNR) **fully pass** industry-standard LLM profiles, maintaining embedding space orientation and eliminating accuracy drop.

---

## Project Structure & Source Code

* **Hardware (RTL):** Fully described in synthesizable Verilog (includes PE, MAC Pipeline, Data Skew Network, Dataflow Controller, and Rescale Pipeline).
* **Target Model:** Based on the **Qwen2-Audio** implementation from [Audio_Speech_Conversation](https://github.com/tranquangchung/Audio_Speech_Conversation).
* **Software & Verification:** The end-to-end evaluation and data feeding pipeline is available here:
  * **Python Notebook:** [Kaggle Notebook](https://www.kaggle.com/code/duynguynngphng/testmodel?scriptVersionId=322782601)

*Project by:*
* **Nguyen Dang Phuong Duy** - [DuyNDP](https://github.com/DuyNDP)
* **Vu Dai Duong** - [VuDaiDuong_325](https://github.com/VuDaiDuong-325)
