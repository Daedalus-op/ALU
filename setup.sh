#/bin/bash

function test() {
  echo " ---------------------Compiling...-------------------------------- "
  
  if [ $# == 1 ]; then
    if [ $1 == "mul" ]; then
      iverilog -o play fin/mul_tb.v fin/d_*.v
    elif [ $1 == "add" ]; then
      iverilog -o play fin/add_tb.v fin/d_*.v
    elif [ $1 == "shift" ]; then
      iverilog -o play fin/shifters_tb.v fin/d_*.v
    elif [ $1 == "shift1" ]; then
      iverilog -o play fin/shift1_tb.v fin/d_*.v
    elif [ $1 == "logic" ]; then
      iverilog -o play fin/logic_tb.v fin/d_*.v
    fi
  else 
    iverilog -o play *_tb.v d_*.v fin/d_*.v
  fi
  
  echo " ---------------------Running Output File------------------------- "
  vvp play
  echo " ---------------------Waveform Veiwer----------------------------- "
  echo "Press - Ctrl + q to exit"
  echo "Press - Ctrl + c to interrupt"
  gtkwave *.vcd 
  echo " ---------------------Done!--------------------------------------- "
}
