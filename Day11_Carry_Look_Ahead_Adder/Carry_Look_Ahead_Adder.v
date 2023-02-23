module CLA_adder (input [3:0] a, b, output [3:0] sum);
    
    wire [3:0] c;
    
    assign c[0] = a[0] & b[0];
    assign c[1] = a[1] & b[1] | a[1] & c[0] | b[1] & c[0];
    assign c[2] = a[2] & b[2] | a[2] & c[1] | b[2] & c[1];
    assign c[3] = a[3] & b[3] | a[3] & c[2] | b[3] & c[2];
    
    assign sum = a + b + c;
    
endmodule







/*
This code defines a 4-bit Carry Look-Ahead Adder in Verilog. Here is a line-by-line explanation of the code:

First line defines a Verilog module called CLA_adder. It has three input ports, a and b which are 4-bit binary numbers, 
and an output port called sum, which is also a 4-bit binary number.
Third line defines a 4-bit wire called c. This wire will hold the carry bits for the addition operation.

Fifth line computes the carry bit for the least significant bit of the sum (c[0]). It does so by taking the bitwise AND 
of the least significant bits of a and b.

Sixth line computes the carry bit for the second least significant bit of the sum (c[1]). It does so using a combination 
of AND and OR logic with the input bits and the carry bit from the previous bit.

Seventh line computes the carry bit for the third least significant bit of the sum (c[2]). It does so using a similar 
combination of AND and OR logic with the input bits and the carry bit from the previous bit.

Eight line computes the carry bit for the most significant bit of the sum (c[3]). It does so using the same combination 
of AND and OR logic with the input bits and the carry bit from the previous bit.

Tenth line computes the sum of a, b, and the carry bits c. This is the final output of the module.*/