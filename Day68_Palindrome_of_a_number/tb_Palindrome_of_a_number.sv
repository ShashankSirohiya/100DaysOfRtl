module palindrome_number_tb;
  reg [7:0] num;
  wire is_palindrome;
  
  palindrome_number dut (
    .num(num),
    .is_palindrome(is_palindrome)
  );
  
  initial begin
    // Test Case 1: Palindrome number
    num = 8'b01011010;
    #10;
    
    // Test Case 2: Non-palindrome number
    num = 8'b11001010;
    #10;
    
    // Test Case 3: Single-digit number
    num = 8'b00001000;
    #10;
    
    // Test Case 4: Palindrome number with odd number of digits
    num = 8'b11100111;
    #10;
    
    $finish;
  end
  
endmodule