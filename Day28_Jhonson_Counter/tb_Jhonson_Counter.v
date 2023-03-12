module tb_jhonson_counter;
    reg clk;
    reg clr;
    wire [3:0] out;
    integer i;
    
    jhonson_counter uut0(
            .clk(clk),
            .clr(clr),
            .out(out)
            );

    always begin
        clk = 0;
        #10;
        clk = 1;
        #10;
    end

    initial begin
        clr = 1;
        #50;
        clr = 0;
        #50;
        for(i=0; i<16; i=i+1) begin
            $display("%d %b", i, out);
            #20;
        end
        $finish;
    end

endmodule