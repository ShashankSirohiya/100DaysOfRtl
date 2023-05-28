module data_encryption (
  input [7:0] data_in,
  input [7:0] key,
  output reg [7:0] data_out
);
  reg [7:0] encrypted_data;
  
  always @(data_in, key) begin
    encrypted_data = data_in ^ key;
  end
  
  assign data_out = encrypted_data;
  
endmodule