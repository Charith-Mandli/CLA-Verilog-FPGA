Parameterized Carry Lookahead Adder using Verilog HDL

This project implements a parameterized Carry Lookahead Adder (CLA)
using Verilog HDL.

The design was developed and verified using Xilinx Vivado and
targets FPGA implementation on the Zynq-7000 FPGA family.

The project demonstrates:
- Modular RTL design
- Carry-lookahead arithmetic logic
- Parameterized hardware architecture
- Functional verification
- FPGA synthesis and implementation flow

Features
- Parameterized CLA architecture
- Generate and Propagate logic
- Parallel carry computation
- Randomized verification testing
- Vivado simulation support
- FPGA implementation flow

Tools Used
- Verilog HDL
- Xilinx Vivado
- Vivado Simulator
- Zynq-7000 FPGA

Project Structure
CLA-Verilog-FPGA/
│
├── rtl/
├── testbench/
├── screenshots/
├── simulation/
├── implementation/
├── report/
└── docs/

Verification
The design was verified using:
- Directed testing
- Overflow testing
- Randomized test vectors
- Waveform analysis

FPGA Flow
The project successfully completed:
- Synthesis
- Optimization
- Placement
- Routing
- FPGA implementation

Future Improvements
- Hierarchical Carry Lookahead Adders 
- FPGA hardware deployment using physical switches and LEDs 
- SystemVerilog-based verification 
- Timing optimization for larger bit-widths 