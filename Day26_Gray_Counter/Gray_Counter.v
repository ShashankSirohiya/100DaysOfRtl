module gray_counter(
    input clk,rst,
    output reg [3:0] y
    );
    
    reg t1,t2,t3;
    reg [3:0] count;
   
    always@(posedge clk)
        begin 
            if(rst)
                begin
                    y=4'b0000;
                    count=4'b0000;
                end
            else
                begin
                    count = count + 1;
                    t3 = count[3]^count[2];
                    t2 = count[2]^count[1];
                    t1 = count[1]^count[0];
                    y = {count[3],t3,t2,t1};
               end
        end   
endmodule