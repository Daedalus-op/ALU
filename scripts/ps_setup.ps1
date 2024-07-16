function test {
    param (
        [Parameter(Mandatory=$false)]
        [ValidateSet("mul", "add", "shift", "shift1", "logic", "alu")]
        [string]$TestCase,
        [Parameter(Mandatory=$false)]
        [ValidateSet("n")]
        [string]$NoWaveform
    )

    Write-Host " --------------------- Compiling...----------------------------- "
    if ($PSBoundParameters.Count -eq 1 -or $PSBoundParameters.Count -eq 2) {
        switch ($TestCase) {
            "mul" {
                iverilog -o play fin/mul_tb.v fin/d_*.v
            }
            "add" {
                iverilog -o play fin/add_tb.v fin/d_*.v
            }
            "shift" {
                iverilog -o play fin/shifters_tb.v fin/d_*.v
            }
            "shift1" {
                iverilog -o play fin/shift1_tb.v fin/d_*.v
            }
            "logic" {
                iverilog -o play fin/logic_tb.v fin/d_*.v
            }
            "alu" {
                iverilog -o play fin/alu_tb.v fin/d_*.v
            }
            default {
                iverilog -o play *_tb.v d_*.v fin/d_*.v
            }
        }
    }
    else {
        iverilog -o play *_tb.v d_*.v fin/d_*.v
    }

    Write-Host " ---------------------Running Output File----------------------------- "
    vvp play

    if ($PSBoundParameters.Count -eq 1 -and $NoWaveform -eq "n") {
        Write-Host " ---------------------Waveform Veiwer----------------------------- "
        Write-Host "Press - Ctrl + q to exit"
        Write-Host "Press - Ctrl + c to interrupt"
        gtkwave *.vcd
    }
    elseif ($PSBoundParameters.Count -eq 2 -and $NoWaveform -eq "n") {
        Write-Host " ---------------------Waveform Veiwer----------------------------- "
        Write-Host "Press - Ctrl + q to exit"
        Write-Host "Press - Ctrl + c to interrupt"
        gtkwave *.vcd
    }
    else {
        Write-Host " ---------------------Waveform Veiwer----------------------------- "
        Write-Host "Press - Ctrl + q to exit"
        Write-Host "Press - Ctrl + c to interrupt"
        gtkwave *.vcd
    }
    Write-Host " ---------------------Done!--------------------------------------- "
}
