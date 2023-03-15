module one_hot_fsm_tb;

        reg clk, reset;
        wire [3:0] state;
        wire out1, out2;

        one_hot_fsm dut (
          .clk(clk), .reset(reset),
          .state(state), .out1(out1), .out2(out2)
        );

        initial begin
          clk = 0;
          reset = 1;
          #10 reset = 0;
        end

        always #5 clk = ~clk;

endmodule