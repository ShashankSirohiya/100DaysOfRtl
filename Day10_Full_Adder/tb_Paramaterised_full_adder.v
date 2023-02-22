module tb_Paramaterised_full_adder;
	
		defparam dut0.size=8;
		reg [dut0.size-1:0]a;
		reg [dut0.size-1:0]b;
		reg cin;
		wire [dut0.size-1:0]sum;
		wire carry;

                Paramaterised_full_adder dut0 (.a(a),
				          .b(b),
				          .cin(cin),
				          .sum(sum),
					  .carry(carry) );
    
	
		 defparam dut1.size=16;
		 reg [dut1.size-1:0]a_16;
		 reg [dut1.size-1:0]b_16;
		 reg cin_16;
		 wire [dut1.size-1:0]sum_16;
		 wire carry_16;

	         Paramaterised_full_adder dut1 (.a(a_16),
					        .b(b_16),
					        .cin(cin_16),
					        .sum(sum_16),
					        .carry(carry_16) );
				    
    
			initial begin
			    a=0;
			    	a_16=0;
			    b=0;
			    	b_16=0;
			    cin=0;
			   	cin_16=0;
			    #10;    
			end

			always begin
			    a=$random;
			    	a_16=$random;
			    b=$random;
			    	b_16=$random;
			    cin=$random;
			   	cin_16=$random;   
			    #20;
			end   
endmodule : tb_Paramaterised_full_adder
