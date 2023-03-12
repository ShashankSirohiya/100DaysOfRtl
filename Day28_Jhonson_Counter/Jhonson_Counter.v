module jhonson_counter(
    input clk,
    input clr,
    output reg [3:0] out
);

always@(posedge clk) begin
    if(clr) begin
        out <=4'b0000;
    end else begin
        out <={~out[0], out[3:1]};
    end 
end 

endmodule