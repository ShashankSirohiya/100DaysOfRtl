
module data_decryption_tb;
  reg [7:0] encrypted_data;
  reg [7:0] key;
  wire [7:0] decrypted_data;
  
  data_decryption dut (
    .data_in(encrypted_data),
    .key(key),
    .data_out(decrypted_data)
  );
  
  initial begin
    // Test Case 1: Decryption with original values from encryption testbench
    encrypted_data = 8'b11111111;
    key = 8'b10101010;
    #10;
    
    // Test Case 2: Decryption with original values from encryption testbench
    encrypted_data = 8'b11111111;
    key = 8'b00110011;
    #10;
    
    // Test Case 3: Decryption with original values from encryption testbench
    encrypted_data = 8'b11110000;
    key = 8'b00001111;
    #10;
    
    // Test Case 4: Decryption with original values from encryption testbench
    encrypted_data = 8'b11111111;
    key = 8'b01010101;
    #10;
    
    $finish;
  end
  
endmodule


