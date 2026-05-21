# Parameterized Carry Lookahead Adder (CLA) using Verilog HDL

## Overview

This project implements a **Parameterized Carry Lookahead Adder (CLA)** using **Verilog HDL** and demonstrates the complete FPGA design workflow using **Xilinx Vivado**.

The design improves addition speed by reducing the delay caused by ripple carry propagation in conventional adders.

The project includes:
- Modular RTL design
- Carry-lookahead logic implementation
- Functional verification using a testbench
- Randomized testing
- FPGA synthesis and implementation
- Timing and power analysis

This project was developed as a beginner FPGA/Verilog mini-project to gain practical exposure to:
- Digital Design
- Verilog HDL
- FPGA workflows
- Verification techniques
- Vivado implementation flow

---

# What is a Carry Lookahead Adder?

A Carry Lookahead Adder (CLA) is a fast adder architecture used in digital systems.

Unlike Ripple Carry Adders, where each carry waits for the previous carry to propagate, CLA computes carry signals in parallel using:

- Generate signals (G)
- Propagate signals (P)

This significantly improves arithmetic speed.

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
1. Generation_Propagation Module

  Generates:
  - Generate signal (G)
  - Propagate signal (P)

  Used for carry-lookahead computation.

2. Carry Module

  Computes carry signals in parallel using:

  - Generate signals
  - Propagate signals
  - Nested carry-lookahead equations

  This reduces carry propagation delay.

3. Sum Module

  Computes final sum outputs using:

  - Input operands
  - Generated carry signals

4. Top Module

  Integrates all submodules together.

5. Testbench

  Performs:

  - Directed test cases
  - Overflow testing
  - Randomized verification
  - Output monitoring
  - Automatic mismatch checking
  - Verification Methodology

  The design was verified using:

  - Functional simulation
  - Directed testing
  - Randomized testing
  - Waveform analysis

---

# Verification condition:

A + B + Cin == {Cout, Sum}

The outputs were continuously checked against expected arithmetic results.

---

# FPGA Workflow

The project successfully completed:

- RTL Design
- Behavioral Simulation
- Synthesis
- Design Optimization
- Placement
- Routing
- FPGA Implementation

using Xilinx Vivado.

---

# Tools Used

- Verilog HDL
- Xilinx Vivado
- Vivado Simulator
- Zynq-7000 FPGA Series

---

# Target Device:

xc7z010clg225-1

---

# Key Learnings

Through this project, the following concepts were learned:

Verilog HDL design
- Modular RTL architecture
- Carry-lookahead arithmetic
- Parameterized hardware design
- Functional verification
- Randomized testing
- FPGA synthesis flow
- Timing and power analysis
- Vivado implementation workflow
- Future Improvements

---

# Possible future extensions include:

- Hierarchical Carry Lookahead Adders 
- FPGA hardware deployment using physical switches and LEDs 
- SystemVerilog-based verification 
- Timing optimization for larger bit-widths 

---

# Outputs Obtained:

1. Zoomed-In Functional Waveform

<img width="867" height="578" alt="N=4 Zoomed in" src="https://github.com/user-attachments/assets/f86e8ba2-9b68-40a0-98d0-f0e60b4c2ad9" />


2. Zoomed-Out Randomized Verification Waveform

<img width="1627" height="902" alt="N=4 Zoomed out" src="https://github.com/user-attachments/assets/657bb2c8-440b-4ab9-8ce3-1b95fe6feeaa" />


3. TCL Console Output

<img width="1082" height="527" alt="TCL Output N = 4" src="https://github.com/user-attachments/assets/bb84f978-ed26-4a59-9797-6a69a089fa7c" />


4. FPGA Implemented Design

<img width="1633" height="921" alt="Device" src="https://github.com/user-attachments/assets/b16a49fc-76ee-4986-8ebd-5e6b4f61bdcd" />


5. Power Report

<img width="1598" height="505" alt="Power" src="https://github.com/user-attachments/assets/c31928cb-d99a-44c0-8f2b-cf370868c7e3" />


# Notes

This project focuses on:

- RTL design methodology
- Verification workflow
- FPGA implementation flow

The primary implementation was performed for:

N = 8

Additional simulations for:

N = 1, 4, 16

were performed to verify parameterized scalability.

# Author

# M.V.S.Charith
