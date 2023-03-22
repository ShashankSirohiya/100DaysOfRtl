module d_ff(
    input in,
    input clk,
    input rst,
    output reg q
    );
     
always@(posedge clk, posedge rst)
    begin
        if(rst)
            q<=0;
        else
            q<=in;
        end
endmodule

module sipo_4bit(
    input data_in,
    input clk,
    input rst,
    output [3:0]data_out
    );
    
    d_ff d1(data_in,clk,rst,data_out[0]);
    d_ff d2(data_out[0],clk,rst,data_out[1]);
    d_ff d3(data_out[1],clk,rst,data_out[2]);
    d_ff d4(data_out[2],clk,rst,data_out[3]);

endmodule

