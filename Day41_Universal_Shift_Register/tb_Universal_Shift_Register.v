module universal_tb;

    // Inputs
    reg [3:0] i;
    reg [1:0] s;
    reg SR;
    reg SL;
    reg clk;
    reg reset;

    // Outputs
    wire [3:0] A;
    wire SR_output;
    wire SL_output;

    // Instantiate the Unit Under Test (UUT)
    universal uut (
        .i(i), 
        .s(s), 
        .SR(SR), 
        .SL(SL), 
        .clk(clk), 
        .reset(reset), 
        .A(A), 
        .SR_output(SR_output), 
        .SL_output(SL_output)
    );

    initial begin
        // Initialize Inputs
        i = 0;
        s = 0;
        SR = 0;
        SL = 0;
        clk = 0;
        reset = 1;

        // Wait 100 ns for global reset to finish
        reset = 0;
        
        // Add stimulus here

    end
    
    always #10 clk = ~clk;
    
    always
    begin
            i=$random;
            SR=$random;
            SL=$random;
            #21;
    end
    
   always
    begin
            s=2'b00;
            #21;
            s=2'b01;
            #161;
            s=2'b10;
            #161;
            s=2'b11;
            #21;
    end   
endmodule