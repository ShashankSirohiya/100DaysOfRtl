module tb_cube;

    // Inputs
    reg [3:0] in;
    reg clk;
    reg rst_n;

    // Outputs
    wire [11:0] out;

    // Instantiate the DUT
    cube #(
        .width(4),
        .pipeline_width(9)
    ) dut (
        .in(in),
        .clk(clk),
        .rst_n(rst_n),
        .out(out)
    );

    // Generate a clock signal
    always #5 clk = ~clk;

    initial begin
        // Reset
        clk = 0;
        rst_n = 0;
        #10;
        rst_n = 1;
        #10;

        // Test case 1
        in = 2;
        #20;
        
        // Test case 2
        in = 5;
        #20;
        
        // Test case 3
        in = 7;
        #20;
        
        // Test case 4
        in = 0;
        #20;
        
        // Test case 5
        in = 15;
        #20;
        
        // End simulation
        $finish;
    end
endmodule