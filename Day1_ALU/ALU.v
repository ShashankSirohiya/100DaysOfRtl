module ALU (output reg [8:0]result, 
			input [7:0]d0,  // first input
			input [7:0]d1, 	// second input
			input [3:0]sel  // select
	);
always@(*)
begin
	case(sel)
		4'b0000 : begin result = d0 + d1 ;  $display("0-Addition operation");      end
		4'b0001 : begin result = d0 - d1 ;  $display("1-Subtraction operation");   end
		4'b0010 : begin result = d0 * d1 ;  $display("2-Multiplication operation");end  
		4'b0011 : begin result = d0 / d1 ;  $display("3-Division operation"); 	   end

		4'b0100 : begin result = d0 && d1;  $display("4-Logical AND operation");   end
		4'b0101 : begin result = d0 ||d1 ;  $display("5-Logical OR operation");    end
		4'b0110 : begin	result = ~(d0&d1);  $display("6-Not of AND operation");    end 
		4'b0111 : begin result = ~(d0|d1);  $display("7-Not of OR operation");     end  
	
		4'b1000 : begin result = d0<<1 ;    $display("8-Left Shift operation");    end
		4'b1001 : begin result = d1<<1 ;    $display("9-Left Shift operation");    end
		4'b1010 : begin result = d0>>1 ;    $display("10-Right Shift operation");  end  
		4'b1011 : begin result = d1>>1 ;    $display("11-Right Shift operation");  end 
		
		4'b1100 : begin result = !d0 ; 	    $display("12-Logical NOT operation");  end
		4'b1101 : begin result = d0>>>1;    $display("13-ArithmeticRightShiftoperation");    end
		4'b1110 : begin result = ~d0 + 8'b00000001;  $display("14-2's Compliment operation");end 
		4'b1111 : begin result = d0^d1 ;    $display("15-XOR operation");	   end
		default : begin result = 8'bxxxxxxxx ; 	     $display("Default");	   end
	endcase // sel
end
endmodule : ALU


