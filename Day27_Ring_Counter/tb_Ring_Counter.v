module tb_ring_counter;
    reg clk;
    reg reset;
    wire [3:0] out;
    integer i;
    
    ring_counter dut(clk, reset, out);

    always begin
        clk = 0;
        #10;
        clk = 1;
        #10;
    end

    initial begin
        reset = 1;
        #50;
        reset = 0;
        #50;
        for(i=0; i<16; i=i+1) begin
            $display("%d %b", i, out);
            #20;
        end
        $finish;
    end

endmodule