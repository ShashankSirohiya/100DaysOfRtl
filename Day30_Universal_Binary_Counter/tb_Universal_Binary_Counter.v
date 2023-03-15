module tb_Universal_Binary_Counter;

  reg clk, reset, up_down;
  wire [3:0] count;

  Universal_Binary_Counter dut (
    .clk(clk),
    .reset(reset),
    .up_down(up_down),
    .count(count)
    );

      initial begin
        clk = 0;
        reset = 1;
        up_down = 0;

        #10 reset = 0;
        #10 up_down = 1;
        #20 up_down = 0;
        #20 up_down = 1;
        #20 up_down = 0;

        #100 $finish;
      end

      always #5 clk = ~clk;

endmodule : tb_Universal_Binary_Counter
