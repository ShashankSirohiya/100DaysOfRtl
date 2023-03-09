module tb_mod7_counter;

    reg clk;
    reg reset;
    wire [2:0]count;

mod7_counter uut0 (
            .clk(clk),
            .reset(reset),
            .count(count));

    initial begin
        clk=0;
        reset=1;
        #10;
        reset=0;
        #100;
    end

    always #5 clk=~clk;

endmodule