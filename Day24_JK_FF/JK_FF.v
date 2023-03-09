module jk_ff(clk, reset, J, K, Q, Qn);

  input clk, reset, J, K;
  output reg Q, Qn;

  always @ (posedge clk) 
  begin
      if (reset) begin
        Q = 0;
        //Qn = 0;
      end else if (J == 0 && K == 0) begin
          Q = Q;
          Qn = Qn;
      end else if (J == 0 && K == 1) begin
          Q = 0;
          Qn = 1;
      end else if (J == 1 && K == 0) begin
          Q = 1;
          Qn = 0;
      end else begin // S = R = 1 is not allowed
          Q = ~Q;
          Qn = ~Qn;
      end
  end

endmodule
