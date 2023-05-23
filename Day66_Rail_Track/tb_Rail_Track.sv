module rail_track_crossing_tb;
  reg clk;
  reg reset;
  reg train_detected;
  wire gate_open;
  wire lights_on;
  
  rail_track_crossing dut (
    .clk(clk),
    .reset(reset),
    .train_detected(train_detected),
    .gate_open(gate_open),
    .lights_on(lights_on)
  );
  
  initial begin
    clk = 0;
    reset = 1;
    train_detected = 0;
    
    #10 reset = 0;
    
    // Test Case 1: No train detected
    //train_detected = 0;
    #20 train_detected = 0;
    
    // Test Case 2: Train detected, gate lowering and lights on
    //train_detected = 1;
    #20 train_detected = 1;
    #40 train_detected = 0;
    
    // Test Case 3: Train detected, gate lowered, lights on, train leaves
    train_detected = 1;
    #20 train_detected = 1;
    #40 train_detected = 0;
    //#30 train_detected = 0;
    
    // Test Case 4: Train detected, gate lowering and lights on, train detected again
    //train_detected = 1;
    #20 train_detected = 1;
    #20 train_detected = 0;
    #20 train_detected = 1;
    
    $finish;
  end
  
  always #5 clk = ~clk;
  
endmodule