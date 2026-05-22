# Parameterized Carry Lookahead Adder (CLA) using Verilog HDL

## Overview

This project implements a **Parameterized Carry Lookahead Adder (CLA)** using **Verilog HDL** and demonstrates the complete FPGA design workflow using **Xilinx Vivado**.

The design improves arithmetic speed by reducing carry propagation delay compared to conventional Ripple Carry Adders.

The project includes:
- Modular RTL design
- Functional verification using a testbench
- Randomized testing
- FPGA synthesis and implementation
- Timing and power analysis

---

## Target FPGA

- Xilinx Zynq-7000 FPGA
- Device: xc7z010clg225-1

---

# What is a Carry Lookahead Adder?

A Carry Lookahead Adder (CLA) is a fast adder architecture that computes carry signals in parallel using Generate (G) and Propagate (P) logic, significantly reducing carry propagation delay compared to Ripple Carry Adders.

---

# Features

- Parameterized bit-width design
- Modular Verilog implementation
- Generate and Propagate logic
- Parallel carry computation
- Directed testing
- Randomized verification
- Functional waveform analysis
- FPGA-compatible RTL design
- Vivado synthesis and implementation

---

# Project Structure

```text
CLA-Verilog-FPGA/
│
├── rtl/
│   └── cla.v
│
├── testbench/
│   └── cla_tb.v
│
├── screenshots/
│
├── simulation/
│
├── implementation/
│
├── report/
│   └── CLA_Report.pdf
│
├── docs/
│
├── README.md
└── .gitignore
```
---

# Modules Used

| Module | Function |
|---|---|
| Generation_Propagation | Generates Generate (G) and Propagate (P) signals |
| Carry | Computes carry signals using carry-lookahead logic |
| Sum | Computes final sum outputs |
| top_module | Integrates all submodules |
| tb_top_module | Performs directed and randomized verification |

---

# Verification

The design was verified using:
- Directed testing
- Randomized testing
- Functional waveform analysis

Verification condition:

A + B + Cin == {Cout, Sum}

---

# FPGA Workflow

The project successfully completed the following Vivado design stages:

- Behavioral Simulation
- Synthesis
- Placement
- Routing
- FPGA Implementation

---

# Tools Used

- Verilog HDL
- Xilinx Vivado
- Vivado Simulator
- Zynq-7000 FPGA Series

---

# Key Learnings

- Verilog HDL design
- Modular RTL architecture
- Carry-lookahead arithmetic
- Parameterized hardware design
- Functional verification
- Randomized testing
- FPGA synthesis flow
- Timing and power analysis
- Vivado implementation workflow

---

# Future Improvements

- Hierarchical Carry Lookahead Adders
- FPGA hardware deployment using switches and LEDs
- SystemVerilog-based verification
- Timing optimization for larger bit-widths

---

# Results

1. Functional Waveform

<img width="867" height="578" alt="N=4 Zoomed in" src="https://github.com/user-attachments/assets/f86e8ba2-9b68-40a0-98d0-f0e60b4c2ad9" />


2. Randomized Verification Waveform

<img width="1627" height="902" alt="N=4 Zoomed out" src="https://github.com/user-attachments/assets/657bb2c8-440b-4ab9-8ce3-1b95fe6feeaa" />


3. TCL Console Output

<img width="1082" height="527" alt="TCL Output N = 4" src="https://github.com/user-attachments/assets/bb84f978-ed26-4a59-9797-6a69a089fa7c" />


4. Implemented Design

<img width="1633" height="921" alt="Device" src="https://github.com/user-attachments/assets/b16a49fc-76ee-4986-8ebd-5e6b4f61bdcd" />


5. Power Report

<img width="1598" height="505" alt="Power" src="https://github.com/user-attachments/assets/c31928cb-d99a-44c0-8f2b-cf370868c7e3" />

---

# Notes

The primary implementation was performed for:
- N = 8

Additional simulations for:
- N = 1, 4, 16

were used to verify parameterized scalability.

---

# Author

M.V.S.Charith
