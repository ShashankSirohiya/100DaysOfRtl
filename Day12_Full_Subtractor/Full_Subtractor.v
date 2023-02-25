module full_subtractor(input [3:0]a,
		       input [3:0]b,
	               input cin,
		       input choice,
		       output reg [3:0]result,
		       output reg cout);
	
	always@(a,b,cin,choice)
	begin
		case(choice)
			1'b0 : {cout,result} = a-b-cin;		//full subtractor
			1'b1 : {cout,result} = a+b+cin;		//full adder
		endcase 
	end
endmodule : full_subtractor
