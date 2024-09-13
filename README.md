# ALU design in verilog  

## Operation table
| op values | Operations | Status |
| :-: | :-: | :-: |
| 000 | Addition | :heavy_check_mark: |
| 001 | Subtraction | :heavy_check_mark: |
| 010 | And | :heavy_check_mark: |
| 011 | Or | :heavy_check_mark: |
| 100 | Not | :heavy_check_mark: |
| 101 | Left Shift | :heavy_check_mark: |
| 110 | Right Shift | :heavy_check_mark: |
| 111 | Multiplication | :heavy_check_mark: |


## Progress
### Done
- CLA parameterised Adder
- RCA parameterised Adder
- Logic Operations
- Shifters
- Multiplier (Array)
- Combining all modules into 1 ALU

### In-Progress

--- 

## Environment
- compiler - iverilog  
- waveform veiwer - GTKWave

--- 

## Extras

### Note -  
For convinience  
- Follow the following development convention
  - playground directory (./playground/) includes source files that are being construction
  - final directory (./final/src/) includes verified and working source files
- Run the following bash script

```sh
chmod +x ./scripts/bash_setup.sh
. ./scripts/bash_setup.sh
```

- Run the command

```sh
test -h
```
