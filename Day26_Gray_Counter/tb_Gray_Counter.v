module gray_counter_tb;

        reg clk,rst;
        wire [3:0]y;

    gray_counter uut(
        .clk(clk),
        .rst(rst),
        .y(y)
        );
    
        initial begin
            clk = 0;
            rst = 1; 
            #10 rst = 0;
        end

        always #5 clk=~clk;

endmodule