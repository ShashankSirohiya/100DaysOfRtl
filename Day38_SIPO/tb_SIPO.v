module tb_sipo;

    // Inputs
    reg data_in;
    reg clk;
    reg rst;

    // Outputs
    wire [3:0] data_out;

    // Instantiate the Unit Under Test (UUT)
    sipo_4bit uut (
        .data_in(data_in), 
        .clk(clk), 
        .rst(rst), 
        .data_out(data_out)
    );

    initial begin
        // Initialize Inputs
        data_in = 0;
        clk = 0;
        rst = 1;

        // Wait 100 ns for global reset to finish
        #10;
        rst=0;
        
        
        
        // Add stimulus here

    end
    
    always
    begin
    data_in = $random;
    #10;
    end
    
    always
    begin
    #5 clk = ~clk;
    end
      
endmodule
