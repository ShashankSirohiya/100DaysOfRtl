module elevator_tb;

    reg clk;
    reg rst;
    reg [1:0] floor;
    
    wire [7:0] seg_led;
    wire [3:0] seg;
    wire [1:0] floor_out;
    
    elevator dut (
        .seg_led(seg_led),
        .seg(seg),
        .floor_out(floor_out),
        .clk(clk),
        .rst(rst),
        .floor(floor)
    );
    
    // Clock generation
    always #5 clk = ~clk;
    
    // Testbench stimulus
    initial begin
        clk = 0;
        rst = 1;
        floor = 2'b00;
        
        #10 rst = 0;  // Assert reset
        
        // Test Case 1: Starting from FG (Floor Ground)
        #20 floor = 2'b00;  // Set floor to FG
        #20 floor = 2'b10;  // Change floor to F2
        
        // Test Case 2: Starting from F1 (Floor 1)
        #20 floor = 2'b01;  // Set floor to F1
        #20 floor = 2'b11;  // Change floor to F3
        
        // Test Case 3: Starting from F2 (Floor 2)
        #20 floor = 2'b10;  // Set floor to F2
        #20 floor = 2'b01;  // Change floor to F1
        
        // Test Case 4: Starting from F3 (Floor 3)
        #20 floor = 2'b11;  // Set floor to F3
        #20 floor = 2'b10;  // Change floor to F2
        
        #50 $finish;  // End simulation
    end
    
    // Display output values
    always @(posedge clk) begin
        $display("Time=%0t: floor_out=%b, seg=%b, seg_led=%h", $time, floor_out, seg, seg_led);
    end
    
endmodule