module clk_phase_tb;
    reg clk;
    reg rst;
    wire clk_0;
    wire clk_90;
    wire clk_180;
    wire clk_270;


    clk_phase uut
        (
            .clk     (clk),
            .rst     (rst),
            .clk_0   (clk_0),
            .clk_90  (clk_90),
            .clk_180 (clk_180),
            .clk_270 (clk_270)
        );

    initial begin
        fork
            begin
                clk = 0;
                forever #0.625 clk = ~clk;
            end
            begin
                rst = 0;
                #20 rst = 1;
            end
        join
    end

endmodule