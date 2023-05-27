module running_led_tb;
  reg clk;
  reg reset;
  wire [3:0] led;
  
  running_led dut (
    .clk(clk),
    .reset(reset),
    .led(led)
  );
  
  initial begin
    clk = 0;
    reset = 1;
    
    #5 reset = 0;
    
    // Test Case 1: LED running pattern
    #50;
    
    // Test Case 2: LED running pattern with reset
    #50 reset = 1;
    #10 reset = 0;
    #50;
    
    // Test Case 3: LED running pattern with different clock frequency
    #50;
    
    // Test Case 4: LED running pattern with reset and different clock frequency
    #50 reset = 1;
    #10 reset = 0;
    #50;
    
  end
  
  always #5 clk = ~clk;
  
endmodule