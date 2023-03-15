module Universal_Binary_Counter (
      input clk,
      input reset,
      input up_down,
      output reg [3:0] count
      );

  always @(posedge clk or posedge reset) begin
      if (reset) begin
        count <= 4'b0000;
      end
      else begin
          if (up_down) begin
            count <= count + 4'b0001;
          end
          else begin
            count <= count - 4'b0001;
          end
      end
    end

endmodule : Universal_Binary_Counter
