# AES Encryption Implementation in Verilog

This repository contains Verilog modules and a testbench for implementing the Advanced Encryption Standard (AES) encryption algorithm. The implementation is targeted for simulation using Xilinx Vivado.

## Project Structure

- `AES_Encrypt.v`: Top-level module implementing AES encryption.
- `SubBytes.v`: Module for the SubBytes transformation.
- `ShiftRows.v`: Module for the ShiftRows transformation.
- `MixColumns.v`: Module for the MixColumns transformation.
- `AddRoundKey.v`: Module for the AddRoundKey transformation.
- `KeyExpansion.v`: Module for key expansion.
- `AES_Encrypt_tb.v`: Testbench for verifying the AES encryption module.
  
## Project Setup and Simulation

1. **Open Vivado** and create a new project.

2. **Add the Verilog source files** (`AES_Encrypt.v`, `SubBytes.v`, etc.) to your Vivado project.

3. **Run Behavioral Simulation** using the provided `AES_Encrypt_tb.v` testbench to verify functionality.

4. **View Simulation Results** to ensure the AES encryption module operates correctly with test vectors.
