module tb_jk_ff;

    reg J;
    reg K;
    reg clk;
    reg reset;

    wire Q;
    wire Qn;

    jk_ff jk_ff (
        .J(J),
        .K(K),
        .clk(clk),
        .reset(reset),
        .Q(Q),
        .Qn(Qn)
    );

    initial begin
        // Initialize Inputs
        J = 0;
        K = 0;
        clk = 0;
        reset = 1;

        // Wait 10 clock cycles before reset is released
        #10 reset = 0;

        // Test case 1: set J to 1
        #20 J = 1;
        #20 J = 0;

        // Test case 2: set K to 1
        #20 K = 1;
        #20 K = 0;

        // Test case 3: toggle J and K
        #20 J = 1;
        #20 K = 1;
        #20 J = 0;
        #20 K = 0;

        // End testbench
        #50 $finish;
    end

    always #5 clk = ~clk;

endmodule

