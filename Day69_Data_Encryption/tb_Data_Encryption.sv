module data_encryption_tb;
  reg [7:0] data_in;
  reg [7:0] key;
  wire [7:0] data_out;
  
  data_encryption dut (
    .data_in(data_in),
    .key(key),
    .data_out(data_out)
  );
  
  initial begin
    // Test Case 1
    data_in = 8'b01010101;
    key = 8'b10101010;
    #10;
    
    // Test Case 2
    data_in = 8'b11001100;
    key = 8'b00110011;
    #10;
    
    // Test Case 3
    data_in = 8'b11110000;
    key = 8'b00001111;
    #10;
    
    // Test Case 4
    data_in = 8'b10101010;
    key = 8'b01010101;
    #10;
    
    $finish;
  end
  
endmodule


