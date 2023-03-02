module tb_Endianess;
	reg  [31:0]data_in;
	wire [31:0]little_e;
	wire [31:0]big_e;

	Endianess uut0(data_in,little_e,big_e);
		initial begin
			data_in=32'b0;
			#10;
		end

		always begin
			data_in=$random;
			#50;
		end

endmodule : tb_Endianess
