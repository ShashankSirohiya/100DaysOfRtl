module Asynchronous_Ram(
				input clk,w_en,
                input [12:0]addr,
                input [7:0]data_in,
                output [7:0]data_out
                );

            reg[7:0]ram[7:0];
            reg[12:0]addr_reg;

        always@(posedge clk)
            begin
            if(w_en)
                ram[addr]<=data_in;
            else
                addr_reg<=addr;
            end

assign data_out=ram[addr_reg];

endmodule : Asynchronous_Ram