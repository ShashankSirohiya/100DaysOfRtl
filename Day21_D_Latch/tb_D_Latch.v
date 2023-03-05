module DLatch_NB_tb;             
        reg d;      // Inputs
        reg en;              
        wire q;     // Outputs
        wire qbar;
                        
      DLatch_NB uut (.d(d),             // Instantiate the Unit Under Test (UUT)
                     .en(en), 
                     .q(q), 
                     .qbar(qbar));
        initial begin             
            d = 0;                     // Initialize Inputs
            en = 0;
            #100;                      // Wait 100 ns for global reset to finish
                                       // Add stimulus here
        end
        always begin
            d=$random;
            en=$random;
            #50;
        end    
endmodule
