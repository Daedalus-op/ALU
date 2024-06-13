# ALU design in verilog  

## Operation table
| op values   | Operations    | Status |
| :-: | :-: | :-: |
| 000 | Addition | :heavy_check_mark: |
| 001 | Subtraction | :heavy_check_mark: |
| 010 | And | :heavy_check_mark: |
| 011 | Or | :heavy_check_mark: |
| 100 | Not | :heavy_check_mark: |
| 101 | Left Shift | :heavy_check_mark: |
| 110 | Right Shift | :heavy_check_mark: |
| 111 | Multiplication | :negative_squared_cross_mark: |


## Progress
### Done
- CLA parameterised Adder
- RCA parameterised Adder
- Logic Operations
- Shifters
- Multiplier (Array)

### In-Progress
- Combining all modules into 1 ALU

--- 

## Environment
- compiler - iverilog  
- waveform veiwer - GTKWave

--- 

## Extras
### Legend
\*_tb.v -> testbenches  
d_*.v -> source design files  
*.vcd -> simulation waveform file  
*.out -> compiled output file    

### Note -  
For convinience  
- Follow the following development convention
  - main directory (./) includes source files that are being construction
  - fin directory (./fin/) includes verified and working source files
- Run the following bash script
```sh
> chmod +x setup.sh
> . setup.sh 
```
- Run the command in terminal in alu main directory
  - To test the source files in main directory
  ```
  > test
  ```
  - To test adders
  ```
  > test add
  ```
  - To test shifters
  ```
  > test shift
  ```
  - To test single shifters
  ```
  > test shift1
  ```
  - To test multipliers
  ```
  > test mul
  ```
  - To test logic modules
  ```
  > test logic
  ```
