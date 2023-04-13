module clk_div_by_3(
    input clk,        // Input clock
    output clk_out   // Output divided clock
);

    reg [1:0] state;

    always @(posedge clk) begin
        case(state)
            2'b00: state <= 2'b01; 		// Transition to next state
            2'b01: state <= 2'b10; 		// Transition to next state
            2'b10: state <= 2'b00; 		// Transition to next state
            default: state <= 2'b00; 	// Default case
        endcase
    end

    assign clk_out = (state == 2'b01); // Output divided clock when in state 2'b01

endmodule
