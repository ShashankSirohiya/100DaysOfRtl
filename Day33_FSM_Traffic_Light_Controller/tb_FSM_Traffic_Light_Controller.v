module tb_tlc;
        reg tb_rst,tb_clk;
        reg tb_pass;
        wire tb_red;
        wire tb_yellow;
        wire tb_green;
        wire [1:0]tb_state;

        tlc uut0 (         
                .reset(tb_rst),
                .clk(tb_clk),
                .pass(tb_pass),
                .red(tb_red),
                .yellow(tb_yellow),
                .green(tb_green),
                .state(tb_state)
                        ); 

                always #5 tb_clk = ~tb_clk;

                initial 
                begin
                tb_clk=1;
                tb_rst=1;
                tb_pass=0;
                #30;
                tb_rst=0;
                #5
                tb_pass=1;
                #10;
                tb_pass=0;
                #30;

                #100 $finish;
                end
 
endmodule
