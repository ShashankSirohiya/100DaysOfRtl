module tb_Dff;

        // Inputs
        reg d;
        reg clk;
        reg reset;

        // Outputs
        wire q;
        wire qbar;

  // Instantiate the Unit Under Test (UUT)
  Dff uut (
    .d(d), 
    .clk(clk), 
    .reset(reset), 
    .q(q), 
    .qbar(qbar)
  );

      initial begin
        // Initialize Inputs
        d = 0;
        clk = 1;
        reset = 0;

        // Wait 100 ns for global reset to finish
        #50;
            
        // Add stimulus here
        d = 1;
        clk = 1;
        reset = 1;
      end
      
      always clk=#10 ~clk;

      always
      begin
        reset=#30 ~reset;
        #20 d = $random;
      end       
endmodule
