module sr_latch_with_enable (
  input S, R, EN,
  output reg Q, Qn
);

  always @ (S, R, EN) begin
    if (EN == 1) begin
    	if (S == 0 && R == 0) begin
	        Q = Q;
	        Qn = Qn;
	    end else if (S == 0 && R == 1) begin
	        Q = 0;
	        Qn = 1;
	    end else if (S == 1 && R == 0) begin
	        Q = 1;
	        Qn = 0;
	    end else begin // S = R = 1 is not allowed
	        Q = 1'bx;
	        Qn = 1'bx;
      end
    end
  end

endmodule













/*
module sr_latch(
		input d,en,
		output q,qbar
    );

wire enbar,dbar,w1,w2;

nor(dbar,d,d);
nor(enbar,en,en);
nor(w1,dbar,enbar);
nor(w2,d,enbar);

SR_Latch l1(w1,w2,q,qbar);

endmodule
*/