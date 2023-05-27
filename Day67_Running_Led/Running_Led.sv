module running_led (
  input wire clk,
  input wire reset,
  output reg [3:0] led
);
  parameter DELAY = 3;  // Number of clock cycles for LED shift delay
  
  reg [3:0] pattern;
  reg [3:0] shifted_pattern;
  reg [4:0] count;
  
  always @(posedge clk or posedge reset) begin
    if (reset) begin
      count <= 0;
      shifted_pattern <= 4'b0001;
    end
    else if (count == DELAY - 1) begin
      shifted_pattern <= shifted_pattern << 1;
      count <= 0;
    end
    else
      count <= count + 1;
  end
  
  always @(posedge clk) begin
    if (reset)
      pattern <= 4'b0000;
    else
      pattern <= shifted_pattern;
  end
  
  assign led = pattern;

endmodule