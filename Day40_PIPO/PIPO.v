module d_ff(
    input in,
    input clk,
    input rst,
    output reg q
    ); 
     
    always@(posedge clk, posedge rst)
    begin
        if(rst)
            q<= 0;
        else 
            q <=in;
        end
endmodule


module pipo(
    input in1,in2,in3,in4,clk,rst,
    output y1,y2,y3,y4
    );
    
    d_ff d1(in1,clk,rst,y1);
    d_ff d2(in2,clk,rst,y2);
    d_ff d3(in3,clk,rst,y3);
    d_ff d4(in4,clk,rst,y4);
    
endmodule