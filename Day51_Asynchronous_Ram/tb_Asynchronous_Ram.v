module tb_Asynchronous_Ram;
			reg clk;
			reg w_en;
			reg [12:0]addr;
			reg [7:0]data_in;
			wire [7:0]data_out;

			Asynchronous_Ram uut0(
			                           	.clk(clk),
			                            .w_en(w_en),
			                            .addr(addr),
			                            .data_in(data_in),
			                            .data_out(data_out)
			                                    );

			initial
			begin
					addr=0;
					data_in=0;
					clk=1;
					w_en=0;

				#10;
					addr=13'b0000000000011;
					data_in=8'b10101011;
					w_en=1;

				#20;
					addr=13'b0000000000011;
					data_in=8'b11101100;
					w_en=0;
				#15;
					addr=13'b0111000100011;
					data_in=8'b11101000;
					w_en=1;
				#15;
					addr=$random;
					data_in=$random;
					w_en=0;
				#50 $finish;
			end

		always #5 clk=~clk;

endmodule : tb_Asynchronous_Ram