#/bin/bash

wd="."

function output ()
{
  echo " ---------------------Waveform Veiwer----------------------------- "
  echo "Press - Ctrl + q to exit"
  echo "Press - Ctrl + c to interrupt"
  gtkwave $wd/outputs/*.vcd 
}

function helps ()
{
  echo "Usage: test [OPTION] [FLAGS]"
  echo "Example :- test mul -n"
  echo
  echo "Available options"
  echo "[NO PARAMETERS] - Test the source files in playground directory"
  echo "alu - Test the complete ALU"
  echo "mul - Test the multiplier"
  echo "add - Test the adder"
  echo "shift - Test the clocked shifter"
  echo "shift1 - Test the single shifter"
  echo "logic - Test the logic functions"
  echo
  echo "Available FLAGS"
  echo "-n - compile with no gtkwave Output"
}


function test() {
  echo " ---------------------Compiling...-------------------------------- "
  
  if [ $# == 1 ] || [ $# == 2 ]; then
    if [ $1 == "mul" ]; then
      iverilog $wd/final/tb/mul_tb.v -o $wd/outputs/play -I $wd/final/src
    elif [ $1 == "add" ]; then
      iverilog $wd/final/tb/add_tb.v -o $wd/outputs/play -I $wd/final/src
    elif [ $1 == "shift" ]; then
      iverilog $wd/final/tb/shifters_tb.v -o $wd/outputs/play -I $wd/final/src
    elif [ $1 == "shift1" ]; then
      iverilog $wd/final/tb/shift1_tb.v -o $wd/outputs/play -I $wd/final/src
    elif [ $1 == "logic" ]; then
      iverilog $wd/final/tb/logic_tb.v -o $wd/outputs/play -I $wd/final/src
    elif [ $1 == "alu" ]; then
      iverilog $wd/final/tb/alu_tb.v -o $wd/outputs/play -I $wd/final/src
    elif [ $1 == "-h" ] || [ $1 == "--help" ]; then
      helps
    fi
  else 
    iverilog *_tb.v -o $wd/outputs/play d_*.v -I $wd/final/ -I .
  fi
  
  if [ $# == 0 ]; then
    echo " ---------------------Running Output File------------------------- "
    vvp $wd/outputs/play
  elif [ $# == 1 ]; then
    if [ $1 != "-h" ]; then
      echo " ---------------------Running Output File------------------------- "
      vvp $wd/outputs/play
      if [ $1 != "-n" ]; then
        output
      fi
    fi
  elif [ $# == 2 ]; then
    echo " ---------------------Running Output File------------------------- "
    vvp $wd/outputs/play
    if [ $2 != "-n" ]; then
      output
    fi
  else
    echo "Invalid number of functions and/or flags"
  fi

  echo " ---------------------Done!--------------------------------------- "
}
