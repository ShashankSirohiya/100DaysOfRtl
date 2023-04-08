module tb_pipeline_shif;

    // Inputs
    reg clk;
    reg a;

    // Outputs
    wire y;

    // Instantiate the DUT
    pipeline_shif #(
        .N(15)
    ) dut (
        .clk(clk),
        .a(a),
        .y(y)
    );

    // Clock generation
    always #5 clk = ~clk; // Generate a 10ns clock

    // Stimulus
    initial begin
        clk = 0;
        a = 0;
        #10 a = 1;
        #20 a = 0;
        #30 a = 1;
        #40 a = 0;
        #50 $finish;
    end

    // Monitor
    always @(posedge clk) begin
        $display("At time %t, y = %b", $time, y);
    end

endmodule