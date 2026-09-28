# RV32I Single-Cycle 32-Bit Processor

![Language](https://img.shields.io/badge/Language-Verilog_HDL-blue.svg)
![ISA](https://img.shields.io/badge/ISA-RISC--V_RV32I-red.svg)
![Simulation](https://img.shields.io/badge/Simulator-Icarus_Verilog-green.svg)

A clean, fully verified, single-cycle 32-bit RISC-V (RV32I) soft-core processor written in modular Verilog HDL. This repository includes the complete Register Transfer Level (RTL) implementation and automated simulation testbenches designed for standard VLSI workflows.

## 📂 Repository Structure

* **`RTL/`**: Contains all synthesizable Verilog design modules (ALU, Control Unit, Register File, Program Counter, Instruction/Data Memory, and the top-level CPU datapath).
* **`Testbench/`**: Contains the Verilog testbench (`cpu_tb.v`) and the compiled machine code instructions (`instructions.hex`) used to verify the processor's functionality.
* **`SIM/`**: Designated for simulation automation scripts (e.g., Makefiles, Bash scripts, or GTKWave `.gtkw` save files). *Note: Compiled binaries and `.vcd` waveform dumps are git-ignored and not uploaded.*

## ⚙️ Core Architecture
The processor natively supports the base RV32I instruction set architecture, executing instructions in a single clock cycle. 
* **Supported Instructions:** R-Type, I-Type, S-Type, B-Type, U-Type, and J-Type.
* **Key Features:** Unified Program Counter adder logic, dual ALU operand multiplexers for dynamic $PC$-relative arithmetic, and dedicated `LUI` bypass paths.

## 🚀 Verification & Simulation
The design is verified locally using **Icarus Verilog** for compilation and **GTKWave** for waveform analysis.

### 1. Compile the Design
To compile the core modules and the testbench together, run the following from the root directory:
```bash
iverilog -o SIM/cpu_sim RTL/*.v Testbench/*.v
