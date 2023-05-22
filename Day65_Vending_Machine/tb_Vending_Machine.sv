
module vending_machine_tb;
  reg clk;
  reg reset;
  reg coin;
  reg [2:0] selection;
  wire vend;
  
  vending_machine dut (
    .clk(clk),
    .reset(reset),
    .coin(coin),
    .selection(selection),
    .vend(vend)
  );
  
  initial begin
    clk = 0;
    reset = 1;
    coin = 0;
    selection = 0;
    
    #10 reset = 0;
    
    // Test Case 1: Insert enough coins and make a selection
    coin = 1;
    selection = 1;
    #5 coin = 0;
    
    // Test Case 2: Insert insufficient coins and make a selection
    coin = 1;
    selection = 2;
    #5 coin = 1;
    #5 coin = 1;
    #5 coin = 0;
    
    // Test Case 3: Insert coins but make no selection
    coin = 1;
    #5 coin = 2;
    #5 coin = 1;
    #5 coin = 0;
    
    // Test Case 4: Insert coins, make a selection, and receive the item
    coin = 1;
    selection = 3;
    #5 coin = 1;
    #5 coin = 1;
    #5 coin = 1;
    #5 coin = 0;
    
    $finish;
  end
  
  always #5 clk = ~clk;
  
endmodule