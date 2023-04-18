module Password (
    input [4:0] in,
    input clk,
    input rst,
    output led,
    output reg [3:0] seg,
    output reg [7:0] seg_led
);
    reg [15:0] count;
    reg [11:0] seg_mem [7:0];
    assign led = (in == 5'b10101) ? 1'b1 : 1'b0;
    
    initial begin
        seg_mem [0] = 12'h7_C1;
        seg_mem [1] = 12'hB_11;
        seg_mem [2] = 12'hD_D5;
        seg_mem [3] = 12'hE_84;
        seg_mem [4] = 12'h7_03;
        seg_mem [5] = 12'hB_31;
        seg_mem [6] = 12'hD_61;
        seg_mem [7] = 12'hE_D4;
    end

    always @(posedge clk or posedge rst) begin
        if(rst) begin
            count <= 0;
        end else begin
            count <= count + 1;
            {seg, seg_led} = seg_mem[{led, count[15:14]}];
        end
    end
endmodule : Password