module tb_Password;
    reg [4:0] in;
    reg clk;
    reg rst;    
    wire led;
    wire [3:0] seg;
    wire [7:0] seg_led;

    safe uut (.in(in), .clk(clk), .rst(rst), .led(led), .seg(seg), .seg_led(seg_led));

    initial begin
    	clk = 0;
    	rst = 1;
        in = 0;
        #10 
    	rst = 0;
    	in = 10;
    	#10
        in = 21;
    end

    always #5 clk = ~clk;

endmodule : tb_Password