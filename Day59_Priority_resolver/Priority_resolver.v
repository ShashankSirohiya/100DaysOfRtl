module priority_resolver(gnt_a,gnt_b,gnt_c,gnt_d,req_a,req_b,req_c,req_d,clk,rst);
  
   output reg gnt_a,gnt_b,gnt_c,gnt_d;
   input req_a,req_b,req_c,req_d;
   input clk,rst;

   parameter idle=3'b000;
   parameter GNTa=3'b001;
   parameter GNTb=3'b010;
   parameter GNTc=3'b011;
   parameter GNTd=3'b100;

   reg [2:0]  p_s,n_s;


   always @ (posedge clk)
     begin
    if(rst)
      p_s=idle;
    else
      p_s=n_s;
     end


   always @ (p_s,req_a,req_b,req_c,req_d)
     begin
    
    n_s=0;

    case (p_s)

      idle:begin

         if(req_a)
           n_s=GNTa;
         else if(req_b)
           n_s=GNTb;
         else if(req_c)
           n_s=GNTc;
         else if(req_d)
           n_s=GNTd;
         else
           n_s=idle;
      end 
      
        GNTa:begin

         if(req_a)
           n_s=GNTa;
         else
           n_s=idle;
      end

      GNTb:begin
         if(req_b)
           n_s=GNTc;
         else
           n_s=idle;
      end

      GNTc:begin
         if(req_c)
           n_s=GNTc;
         else
           n_s=idle;
      end

      GNTd:begin
         if(req_d)
           n_s=GNTa;
         else
           n_s=idle;
      end
    endcase 
     end


always @ (p_s)
  begin
     if(p_s==idle)
       begin
      gnt_a=0;
      gnt_b=0;
      gnt_c=0;
      gnt_d=0;
       end
     else if(p_s==GNTa)
       begin
      gnt_a=1;
      gnt_b=0;
      gnt_c=0;
      gnt_d=0;
       end
     else if(p_s==GNTb)
       begin
      gnt_a=0;
      gnt_b=1;
      gnt_c=0;
      gnt_d=0;
       end
     else if(p_s==GNTc)
       begin
      gnt_a=0;
      gnt_b=0;
      gnt_c=1;
      gnt_d=0;
       end
     else if(p_s==GNTd)
       begin
      gnt_a=0;
      gnt_b=0;
      gnt_c=0;
      gnt_d=1;
       end
  end 
endmodule 