module ram (
    input clk,
    input ce1,
    input ce2,
    input we,
    input oe,
    input [12:0] addr,
    input [7:0] datain,
    output reg [7:0] dataout
);

    reg [7:0] mem [8191:0]; // 8192 words, 7 bits per word
    
    always @(posedge clk) begin
        if (ce1 && ce2 && we) begin
            mem[addr] <= datain;
        end else if (ce1 && ce2 && oe) begin
            dataout <= mem[addr];
        end else begin
            dataout <= 8'bzzzzzzzz;
        end
    end

endmodule