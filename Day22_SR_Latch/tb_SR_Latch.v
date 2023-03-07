module sr_latch_with_enable_tb;

  reg S, R, EN;
  wire Q, Qn;

  // instantiate the module to be tested
  sr_latch_with_enable dut(
    .S(S),
    .R(R),
    .EN(EN),
    .Q(Q),
    .Qn(Qn)
  );

     initial begin
        // Initialize Inputs
        S = 0;
        R = 0;
        EN = 0;
        // Wait 100 ns for global reset to finish
        #10;
    end
    
    always begin
        S=$random;
        R=$random;
        EN =1;
        #20;
    end
      
endmodule
