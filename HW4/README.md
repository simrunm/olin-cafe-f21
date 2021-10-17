# Description of Implemented Models

To implement the models, I first wrote a truth table for a 32:1 MUX. I thought about how it could be built up from smaller muxes and decided to try and use 4:1 MUXs and 2:1 MUXs to create a 32:1 mux. I drew out a diagram that is attached in the pdf for how I would do this. Then I implemented the diagram in verilog by creating and testing a 2:1 mux and a 4:1 mux and combining them all together.

# Testing the 32:1 mux
I tested the 2:1 and 4:1 mux individually so I was already confident that they worked. For testing the  32:1, I used a for loop to go through various values for each of the 32 inputs and I also changed the value of s. I ran the test using the makefile and looked at the output to verify if the mux was working correctly

# How to run the test
Run `make test_mux32` in the terminal. 