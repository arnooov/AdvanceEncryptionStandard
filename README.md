# AES Encryption Implementation in Verilog

This repository contains Verilog modules and a testbench for implementing the Advanced Encryption Standard (AES) encryption algorithm. The implementation is targeted for simulation using Vivado.

1. **Open Vivado and create a new project:**

   - Launch Vivado from your computer's applications or Start menu.
   - Select "Create Project" from the Vivado Quick Start or File menu.
   
2. **Create a New Project Wizard:**

   - In the "Project Name" field, enter a name for your project.
   - Choose or create a directory for your project.
   - Click "Next" to proceed.
   
3. **Select Project Type:**

   - Select "RTL Project" as the project type.
   - Click "Next" to proceed.
   
4. **Add Project Settings:**

   - Under "Default Part," select your target FPGA board model (e.g., Zynq-7000 ZC702, Nexys A7, etc.).
   - Ensure that "Do not specify sources at this time" is selected under "Add Sources."
   - Click "Next" to proceed.
   
5. **Add Verilog Source Files:**

   - In the Vivado project manager, under the Flow Navigator, select "Add Sources" under PROJECT MANAGER.
   - Click "Add Files..." and navigate to the directory where you cloned or saved your Verilog source files.
   - Add the following Verilog source files to your project:
     - `AES_Encrypt.v`: Top-level module implementing AES encryption.
     - `SubBytes.v`: Module for the SubBytes transformation.
     - `ShiftRows.v`: Module for the ShiftRows transformation.
     - `MixColumns.v`: Module for the MixColumns transformation.
     - `AddRoundKey.v`: Module for the AddRoundKey transformation.
     - `KeyExpansion.v`: Module for key expansion.
     - `AES_Encrypt_tb.v`: Testbench for verifying the AES encryption module.
   - Select all the Verilog files (`*.v`) you want to add to your project and click "OK."
   - Click "Finish" to complete adding sources.
   
6. **Set Simulation Settings:**

   - In the Vivado project manager, under the Flow Navigator, select "Simulation" and then "Run Simulation."
   - In the Simulation Settings window, choose "RTL Simulation" as the simulation type.
   - Set `AES_Encrypt_tb.v` as your top module for simulation.
   - Click "OK" to proceed.
   
7. **Run Behavioral Simulation:**

   - Click "Run Simulation" in the Simulation toolbar to start the behavioral simulation.
   - Wait for the simulation to complete.
   
8. **View Simulation Results:**

   - After the simulation completes, view the waveforms and console output to verify that the AES encryption module operates correctly with test vectors.
