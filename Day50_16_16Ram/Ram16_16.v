module Ram16_16(
			input [15:0]data_in,
            input [3:0]address,
            input r_en,w_en,clk,
            output reg[15:0]d_out
             );

    reg [15:0]mem[15:0];   

    always@(posedge clk)
        begin
            if(r_en)
                d_out<=mem[address];
            else if(w_en)
                mem[address]<=data_in;
            else
                d_out<=16'bz;
        end

endmodule : Ram16_16