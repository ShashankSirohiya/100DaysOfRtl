module priority_resolver_tb;
   wire gnt_a,gnt_b,gnt_c,gnt_d;
   reg req_a,req_b,req_c,req_d;
   reg clk,rst;
   priority_resolver uut (gnt_a,gnt_b,gnt_c,gnt_d,req_a,req_b,req_c,req_d,clk,rst);
   
   initial 
     begin
     rst=1'b1;
     clk=1'b0;
     req_a=1'b0;
     req_b=1'b0;
     req_c=1'b0;
     req_d=1'b0;
     #100;
     rst=1'b0;
     end
     
   always 
     begin
     #5 clk=~clk;
     req_a=$random;
     req_b=$random;
     req_c=$random;
     req_d=$random;  
     end
endmodule