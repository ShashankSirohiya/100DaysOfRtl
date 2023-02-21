module Bcd_to_7segment( input A,B,C,D, output a,b,c,d,e,f,g);

assign a = A | C | (B&D) | ((~B)&(~D));
assign b = (~B)| (C&D) | ((~C)&(~D));
assign c = B | (~C) | (D);
assign d = A | ((~B)&(~D)) | ((~B)&C) | (C&(~D)) | (B&(~C)&D);
assign e = ((~B)&(~D)) | C&(~D) ;
assign f = A | B&(~C) | ((C)&(~D)) | (B&(~D));
assign g = A | B&(~C) | (~B)&C | (C&(~D));

endmodule : Bcd_to_7segment















/*This code represents a module that converts a 4-bit BCD (Binary Coded Decimal) input to a 7-segment display output.
The module with four input ports A, B, C, and D, representing the four bits of the BCD input, and seven output ports 
a, b, c, d, e, f, and g, representing the seven segments of the 7-segment display.
The first assign line computes the value of segment a based on the input values. The equation represents the logical OR 
of four terms:A, C, B AND D, and NOT B AND NOT D.
The second assign line computes the value of segment b based on the input values. The equation represents the logical OR 
of three terms: NOT B, C AND D, and NOT C AND NOT D.
The third assign line computes the value of segment c based on the input values. The equation represents the logical OR 
of three terms: B, NOT C, and D.
The fourth assign line computes the value of segment d based on the input values. The equation represents the logical OR 
of five terms: A, NOT B AND NOT D, NOT B AND C, C AND NOT D, and B AND NOT C AND D.
The fifth assign line computes the value of segment e based on the input values. The equation represents the logical OR 
of two terms: NOT B AND NOT D, and C AND NOT D.
The sixth assign line computes the value of segment f based on the input values. The equation represents the logical OR 
of four terms: A, B AND NOT C, C AND NOT D, and B AND NOT D.
The seventh assign line computes the value of segment g based on the input values. The equation represents the logical OR of four 
terms: A, B AND NOT C, NOT B AND C, and C AND NOT D. */