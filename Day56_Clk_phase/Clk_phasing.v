module clk_phase(
    input clk,
    input rst,
    output clk_0,
    output clk_90,
    output clk_180,
    output clk_270
    );
    reg [1:0] count;
    reg div_2;
    always @(posedge clk or negedge rst) begin
        if(~rst) begin
            count <= 0;
        end else begin
            count <= {~count[0], count[1]};
        end
    end

    always @(posedge clk or negedge rst) begin
        if (~rst) begin
            div_2 <= 0;
        end else begin
            div_2 = ~div_2;
        end
    end

    assign clk_0 = count[1];
    assign clk_90 = count[1] ^ div_2;
    assign clk_180 = ~count[1];
    assign clk_270 = ~clk_90;

endmodule