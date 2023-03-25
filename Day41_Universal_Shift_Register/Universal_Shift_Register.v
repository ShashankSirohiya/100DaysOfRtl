module mux4_1(
    input [3:0] i,
    input [1:0] s,
    output y
    );

assign y = ((~s[1])&(~s[0])&i[0]) | ((~s[1])&(s[0])&i[1]) | ((s[1])&(~s[0])&i[2]) | ((s[1])&(s[0])&i[3]);

endmodule
//______________________________________________________________________________

module d_ff(input d,clk,reset,output reg q
    );
     
     always@(posedge clk,posedge reset)
     begin
	     if(reset)
	        q<=0;
	     else
	    	q<=d;
     end

endmodule

//______________________________________________________________________________

module universal(
    input [3:0] i,
    input [1:0] s,
    input SR,SL,
    input clk,reset,
    output [3:0] A,
    output SR_output,SL_output
    );
     
     wire j1,j2,j3,j4,o1,o2,o3,o4;
     
     mux4_1 m1({i[3],o2,SR,o1},s,j1);
     d_ff b1(j1,clk,reset,o1);
     
     mux4_1 m2({i[2],o3,o1,o2},s,j2);
     d_ff b2(j2,clk,reset,o2);
     
     mux4_1 m3({i[1],o4,o2,o3},s,j3);
     d_ff b3(j3,clk,reset,o3);
     
     mux4_1 m4({i[0],SL,o3,o4},s,j4);
     d_ff b4(j4,clk,reset,o4);
     
     assign SL_output=o1;
     assign SR_output=o4;
     
     assign A[3] = o1&(s[1]&s[0]);
     assign A[2] = o2&(s[1]&s[0]);
     assign A[1] = o3&(s[1]&s[0]);
     assign A[0] = o4&(s[1]&s[0]);


endmodule
//______________________________________________________________________________________