# Create work library
vlib work

# Compile Verilog
#     All Verilog files that are part of this design should have
#     their own "vlog" line below.
vlog "./startBit.v"
vlog "./BSC.v"
vlog "./BIC.v"
vlog "./clkCounter.v"
vlog "./clkCounter2.v"
vlog "./DFlipFlop.v"
vlog "./DFlipFlop2.v"
vlog "./receive.v"
vlog "./SIPO.v"
vlog "./transmit.v"
vlog "./PISO.v"
vlog "./mux2.v"
vlog "./serialCom.v"
vlog "./SIPOshiftRegister.v"


# Call vsim to invoke simulator
#     Make sure the last item on the line is the name of the
#     testbench module you want to execute.
vsim -voptargs="+acc" -t 1ps -lib work stb

# Source the wave do file
#     This should be the file that sets up the signal window for
#     the module you are testing.
do s_wave.do

# Set the window types
view wave
view structure
view signals

# Run the simulation
run -all

# End
