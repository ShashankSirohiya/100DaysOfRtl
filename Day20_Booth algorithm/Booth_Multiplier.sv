module Booth_Multiplier(PRODUCT, A, B);
  output reg signed [7:0] PRODUCT;
  input signed [3:0] A, B;

  reg [1:0] temp;
  integer i;
  reg e;
  reg [3:0] B1;

  always @(A,B)
  begin
    PRODUCT = 8'd0;
    e = 1'b0;
    B1 = -B;
    
    for (i=0; i<4; i=i+1)
    begin
      temp = { A[i], e };
      case(temp)
        2'd2 : PRODUCT[7:4] = PRODUCT[7:4] + B1;
        2'd1 : PRODUCT[7:4] = PRODUCT[7:4] + B;
      endcase
      PRODUCT = PRODUCT >> 1;
      PRODUCT[7] = PRODUCT[6];
      e=A[i];
      
    end
  end
  
endmodule : Booth_Multiplier










/*
first line declares a module named "Booth_Multiplier" which takes in two inputs, A and B, and has one output, PRODUCT.
2nd line declares the output port "PRODUCT" as an 8-bit signed register.
3rd line declares the input ports "A" and "B" as signed 4-bit registers.
next four lines declares a 2-bit register "temp" which is used to store the concatenation of a bit from "A" and a carry bit.
then declares an integer variable "i" which is used to count the number of iterations in the for loop.
then declares a 1-bit register "e" which is used to store the carry bit.
then declares a 4-bit register "B1" which is used to store the negative value of "B". 

There is an always block which triggers whenever there is a change in the input ports "A" and "B". The contents of this block 
are executed every time there is a change in "A" and "B".
Then next lines initialize the variables "PRODUCT", "e", and "B1". "PRODUCT" is initialized to 0, "e" is initialized to 0, and "B1" 
is set to the negative value of "B".
Line 16 is a for loop which iterates 4 times, corresponding to the 4 bits in "A".
line sets the value of "temp" to the concatenation of the i-th bit of "A" and the carry bit "e".
There is a case statement which checks the value of "temp". If "temp" is equal to 2'b10, then "B1" is added to the upper 4 bits 
of "PRODUCT". If "temp" is equal to 2'b01, then "B" is added to the upper 4 bits of "PRODUCT".
These lines shift the contents of "PRODUCT" one bit to the right, set the MSB of "PRODUCT" to the previous value of the second 
MSB, and set the carry bit "e" to the i-th bit of "A".
Then marks the end of the for loop.
*/