module tb_8bit_siso;

    reg s_in,clk,rst;
    wire s_out;

    siso uut(s_in,clk,rst,s_out);
    
    initial
        begin
            s_in =0;
            clk = 0;
            rst = 1;
            #10 rst = 0;
        end
    always
        begin
            s_in = $random;
            #20;
        end
        
    always #5 clk = ~clk;
endmodule