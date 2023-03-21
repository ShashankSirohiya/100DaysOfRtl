/*
 //================================================================================================================================================================
 //============================================================================================SISO================================================================
module siso(
    input in,
    input clk,
    input rst,
    output reg op
    );
reg [7:0]w;

always@(posedge clk,posedge rst)
begin
if(rst)
    op<=0;
else
begin
    w[0]<=in;
    w[1]<=w[0];
    w[2]<=w[1];
    w[3]<=w[2];
    w[4]<=w[3];
    w[5]<=w[4];
    w[6]<=w[5];
    w[7]<=w[6]; 
    op<=w[7];
end
end
endmodule
*/
 //============================================================================================
 //============================================================================================
 
module d_ff(
    input d,clk,reset,
    output reg q
    );

    always@(posedge clk) begin
        if(reset)
            q <= 0;
        else
            q <= d;
    end    
endmodule


module siso(
    input s_in,
    input clk,rst,
    output s_out
    );
    //parameter N = 8;
    localparam N = 7; 
    wire [N:0]temp;
    
    genvar i;
    generate                                            // n instances
        for(i=0;i<N;i=i+1) 
            begin
                d_ff d (temp[i],clk,rst,temp[i+1]);
              //   d_ff temp[i+1] = temp [i];
            end
    endgenerate  
    
    assign temp[0]=s_in;
    assign s_out=temp[N];

endmodule


/*
 //============================================================================================
 //============================================================================================
module d_ff(
    input in,
    input clk,
    input rst,
    output reg q
    );
     
always@(posedge clk, posedge rst)
    begin
        if(rst)
            q<=0;
        else
            q<=in;
        end
endmodule
    
module siso_4bit(
    input q,f_clk,f_rst,
    output q_out
    );
    wire t1,t2,t3;
    d_ff d1(q,f_clk,f_rst,t1);
    d_ff d2(t1,f_clk,f_rst,t2);
    d_ff d3(t2,f_clk,f_rst,t3);
    d_ff d4(t3,f_clk,f_rst,q_out);
endmodule

 //============================================================================================
 //============================================================================================

module siso(                                                             // serial in serial out
    input i,
    input clk,
    input reset,
    output y
     );
    wire t1,t2,t3;
    d_ff d1(i,clk,reset,t1);
    d_ff d2(t1,clk,reset,t2);
    d_ff d3(t2,clk,reset,t3);
    d_ff d4(t3,clk,reset,y);
    
endmodule

 //============================================================================================
 //============================================================================================
*/

