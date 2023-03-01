module tb_Dmux;
		reg i;
		reg [1:0] s;
		wire [3:0] y;

	Dmux uut (.i(i), 
			  .s(s), 
			  .y(y));
		initial 
		begin
			i = 0;
			s = 0;
			#50;
		end
		
		always
		begin
			#100;
			i=$random;
			s=$random;
		end    
endmodule : tb_Dmux
