module Dff(
    input d,clk,reset,
    output reg q,qbar
    );
    
   always@(posedge clk,posedge reset) // asynchronous 
   // always@(posedge clk) //synchronous
    begin
        if(reset)
          begin
            q = 1'b0;
            qbar = 1'b1;
          end
        else
          begin
            q = d;
            qbar = (~d) ;
          end
    end
    
endmodule