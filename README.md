# ALU design in verilog  
- compiler - iverilog  
- waveform veiwer - GTKWave
---
*_tb.v -> testbenches  
d_*.v -> source design files  
*.vcd -> simulation waveform file  
*.out -> compiled output file  
---
Note :-  
For convinience add the following lines to .bashrc file
```
function run() {
  elif [ "$PWD" = "$HOME/alu" ];then
    iverilog *_tb.v d_*.v ~/alu/fin/d*.v
    ~/alu/a.out
    gtkwave *.vcd
  fi
}
```
