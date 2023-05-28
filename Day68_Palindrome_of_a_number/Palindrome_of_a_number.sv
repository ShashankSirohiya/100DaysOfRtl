module palindrome_number (
  input [7:0] num,
  output reg is_palindrome
);
  reg [7:0] reverse_num;
  
  always @(num) begin
    reverse_num = 8'b0;
    
    for (int i = 7; i >= 0; i = i - 1)
      reverse_num = reverse_num | (num[i] << (7 - i));
  end
  
  assign is_palindrome = (num == reverse_num);
  
endmodule