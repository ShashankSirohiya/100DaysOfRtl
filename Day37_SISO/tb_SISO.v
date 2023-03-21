/*
module tb_siso_generic_8bit;

reg in,clk,rst;
wire op;


parameterized_pipelined_register dut0 (   
                  .in(in),
                  .clk(clk),
                  .rst(rst),
                  .op(op) 
                        );
                        
initial
begin
clk=1;
rst=1;
in=1;

#10;
rst=0;
in=1;

#10;
rst=0;
in=0;

#10;
rst=0;
in=1;

#10;
rst=0;
in=0;

#10;
rst=0;
in=1;

#10;
rst=0;
in=0;

#10;
rst=0;
in=1;

#10;
rst=0;
in=$random;

#10;
rst=0;
in=$random;

#10;
rst=0;
in=1;

#10;
rst=0;
in=1;
end

initial 
    begin
        clk = 0;
        in = 0;
        rst = 1;
        #15 rst = 0;
        
    end

always #5 clk=~clk;

always #20 in = $random;

endmodule



//=======================================================================================
//==========================================================================================


module siso_tb;
    reg i;
    reg clk;
    reg reset;
    wire y;
    
    sipo uut(
        .i(i),
        .clk(clk),
        .reset(reset),
        .y(y)
        );
        
    initial
    begin
    clk = 0;
    i=0;
    reset = 1;
    #30;
    reset = 0;
    end
    
    always
    begin
    clk = ~clk;
    i = $random;
    #50;
    end
endmodule


//=======================================================================================
//==========================================================================================

module siso_5bit_tb;

    reg s_in,clk,rst;
    wire s_out;
    defparam uut.N=5;

    siso uut(s_in,clk,rst,s_out);
    
    initial
        begin
            s_in =0;
            clk = 0;
            rst = 1;
            #10;
            rst = 0;
        end
    always
        begin
            s_in = $random;
            #20;
        end
        
    always #5 clk = ~clk;
endmodule



*/
//=======================================================================================
//==========================================================================================

module siso_8bit_tb;

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



/*
//=======================================================================================
//==========================================================================================


module siso_8bit_tb;

    reg s_in,clk,rst;
    wire s_out;
    defparam uut.N=8;

    siso uut(s_in,clk,rst,s_out);
    
    initial
        begin
            s_in =0;
            clk = 0;
            rst = 1;
            #10;
            rst = 0;
        end
    always
        begin
            s_in = $random;
            #20;
        end
        
    always #5 clk = ~clk;
endmodule
*/