
module sequence_counter_tb;

reg clk, reset;
wire [3:0] out;

sequence_counter counter(.clk(clk), .reset(reset), .out(out));

    initial 
        begin
        clk = 0;
        reset = 1;
        
       # 10 reset = 0 ;
        end
        
    always #5 clk = ~clk;
endmodule

