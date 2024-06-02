# ALU design in verilog  

## Operation table
| op values   | Operations    |
| :-: | :-: |
| 000 | Addition |
| 001 | Subtraction |
| 010 | And |
| 011 | Or |
| 100 | Not |
| 101 | Left Shift |
| 110 | Right Shift |
| 111 | Multiplication |


## Progress
### Done
- CLA parameterised Adder
- RCA parameterised Adder
- Logic Operations

### In-Progress
- Multiplier
- Testing Shifters

### Not started
- Divider

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
- Add the following lines to .bashrc file
```sh
function run() {
  elif [ "$PWD" = "$HOME/alu" ];then
    iverilog *_tb.v d_*.v fin/d_*.v
    ./a.out
    gtkwave *.vcd
  fi
}

```
- Run the command in terminal in alu main directory
```
$ run
```
