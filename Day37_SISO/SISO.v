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
    generate                                       
        for(i=0;i<N;i=i+1) 
            begin
                d_ff d (temp[i],clk,rst,temp[i+1]);
            end
    endgenerate  
    
    assign temp[0]=s_in;
    assign s_out=temp[N];

endmodule