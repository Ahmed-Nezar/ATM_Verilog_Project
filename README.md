# ATM_Verilog_Project
## Introduction
This project is a Verilog implementation of an ATM system. It is a basic representation of an ATM system and may require further enhancements for real-world usage.
It consists of Refrence_Code folder which contains the python code of the ATM system and the Verilog_code folder which contains the verilog code of the ATM system.
## Reference Code Structure
- You can find the readme file in the Reference_Code folder which explains the code structure and how to use it.
## Verilog Code Structure
- You can find the readme file in the Verilog_code folder which explains the code structure and how to use it.

## How to Run Synthesis on Questasim
```bash
vlog +acc ./Verilog_Code/atm.v
vsim -debugdb=+acc work.ATM
```
- Then click on view -> schematics -> Click on View Incremental and Check Follow -> Select module you want to see from instances tab
