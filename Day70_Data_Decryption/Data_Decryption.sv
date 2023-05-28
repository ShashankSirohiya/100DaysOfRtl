module data_decryption (
  input [7:0] data_in,
  input [7:0] key,
  output [7:0] data_out
);
  reg [7:0] decrypted_data;
  
  always @(data_in, key) begin
    decrypted_data = data_in ^ key;
  end
  
  assign data_out = decrypted_data;
  
endmodule
