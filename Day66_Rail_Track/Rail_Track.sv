module rail_track_crossing (
  input clk,
  input reset,
  input train_detected,
  output gate_open,
  output reg lights_on
);
  parameter GATE_DELAY = 10;    // Number of clock cycles for gate operation
  parameter LIGHTS_DELAY = 5;   // Number of clock cycles for lights operation
  
  reg [3:0] state;
  reg [3:0] count;
  
  always @(posedge clk or posedge reset) begin
    if (reset)
      state <= 0;
    else begin
      case (state)
        0: begin  // Idle state
          if (train_detected)
            state <= 1;  // Move to the gate lowering state
        end
        1: begin  // Gate lowering state
          if (count == GATE_DELAY)
            state <= 2;  // Move to the gate lowered state
        end
        2: begin  // Gate lowered state
          if (!train_detected)
            state <= 3;  // Move to the gate raising state
        end
        3: begin  // Gate raising state
          if (count == GATE_DELAY)
            state <= 0;  // Move back to idle state
        end
      endcase
    end
  end
  
  always @(posedge clk or posedge reset) begin
    if (reset)
      count <= 0;
    else begin
      if (state == 1 || state == 3) begin
        if (count < GATE_DELAY)
          count <= count + 1;
      end
    end
  end
  
  assign gate_open = (state == 2 || state == 3);
  assign lights_on = (state == 1 || state == 2);
  
endmodule
