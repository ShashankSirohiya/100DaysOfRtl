module vending_machine(
  input clk,
  input reset,
  input coin,
  input[2:0] selection,
  output reg vend
);
  parameter PRICE = 3;  // Price of the item in vending machine
  
  reg [2:0] state;
  reg [3:0] balance;
  
  always @(posedge clk or posedge reset) begin
    if (reset)
      state <= 0;
    else begin
      case (state)
        0: begin  // Idle state
          if (coin && (selection != 0))
            state <= 1;  // Move to the select state
        end
        1: begin  // Select state
          state <= 2;  // Move to the vend state
        end
        2: begin  // Vend state
          state <= 0;  // Move back to idle state
        end
      endcase
    end
  end
  
  always @(posedge clk or posedge reset) begin
    if (reset)
      balance <= 0;
    else begin
      case (state)
        0: begin  // Idle state
          if (coin && (selection != 0))
            balance <= balance + coin;  // Update balance
        end
        1: begin  // Select state
          balance <= balance - PRICE;  // Deduct price from balance
        end
        2: begin  // Vend state
          balance <= balance - PRICE;  // Deduct price from balance
        end
      endcase
    end
  end
  
  assign vend = (state == 2) && (balance >= PRICE);
  
endmodule
