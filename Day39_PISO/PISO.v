module d_ff(
    input in,
    input clk,
    input rst,
    output reg q    
    ); 
    
    always@(posedge clk, posedge rst)
    begin
        if(rst)
            q<= 0;
        else 
            q <=in;
        end
endmodule

module piso (   
    input inA,inB,inC,inD,clk,rst,s_l,
    output q
    );
     wire q1,q2,q3,t1,t2,t3;
    d_ff d1(inA,clk,rst,q1);
     assign t1 = s_l? q1 : inB ;
    d_ff d2(t1,clk,rst,q2);
      assign t2 = s_l? q2 : inC ;
    d_ff d3(t2,clk,rst,q3);
      assign t3 = s_l? q3 : inD ;
    d_ff d4(t3,clk,rst,q);
    
endmodule