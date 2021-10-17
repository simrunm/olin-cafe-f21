# -Wall turns on all warnings
# -g2012 selects the 2012 version of iVerilog
IVERILOG=iverilog -Wall -g2012 -y ./ -I ./
VVP=vvp

# Look up .PHONY rules for Makefiles
.PHONY: clean


MUXS = mux2.sv mux4.sv mux32.sv
ADDERS = adder32.sv adder_1.sv

# Call this to clean up all your generated files
clean:
	rm -f *.bin *.vcd vivado*.log vivado*.jou vivado*.str

test_mux2 : test_mux2.sv mux2.sv
	${IVERILOG} $^ -o test_mux2.bin && ${VVP} test_mux2.bin 

test_mux4 : test_mux4.sv mux4.sv
	${IVERILOG} $^ -o test_mux4.bin && ${VVP} test_mux4.bin 

test_mux32 : test_mux32.sv mux32.sv mux2.sv mux4.sv
	${IVERILOG} $^ -o test_mux32.bin && ${VVP} test_mux32.bin


test_adder_32 : test_adder_32.sv adder_1.sv adder_32.sv
	${IVERILOG} $^ -o test_adder_32.bin && ${VVP} test_adder_32.bin  

# test_shift_register : test_shift_register.sv shift_register.sv
# 	${IVERILOG} $^ -o test_shift_register.bin && ${VVP} test_shift_register.bin

# waves_shift_register: test_shift_register
# 	gtkwave shift_register.vcd -a wave_cfgs/shift_register.gtkw