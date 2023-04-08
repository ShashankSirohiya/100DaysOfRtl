module delays(
    input p,
    input q,
    output reg [3:0] a, b, c,
    output out_gate_delay,
    output out_mtm_delay,
    output out_rf_delay,
    output out_netd_delay,
    output reg out_reg_delay
    );

    or #3 (out_gate_delay, p, q);					//gate delay

    or #(2:3:4) (out_mtm_delay, p, q); 				//minimum, typical and maximum delay

    or #(2, 4) (out_rf_delay, p, q);				//rise and fall delay

    assign #2 out_netd_delay = (p | q);				//regular delay

    always @(*) begin
        #3 out_reg_delay = p | q;
    end

    initial begin
        $monitor($time, " a=%0d, b=%0d, c=%0d",a, b, c);
        b<=10;
        #6 a <= 5;
        a <= #5 b;									//Intra delay
        #15 c <= 12;
        #100 $finish;
    end

endmodule