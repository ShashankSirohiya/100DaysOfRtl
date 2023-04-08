module tb_delays;

    // Inputs
    reg p;
    reg q;

    // Outputs
    wire [3:0] a;
    wire [3:0] b;
    wire [3:0] c;
    wire out_gate_delay;
    wire out_mtm_delay;
    wire out_rf_delay;
    wire out_netd_delay;
    wire out_reg_delay;

    // Instantiate the DUT
    delays dut (
        .p(p),
        .q(q),
        .a(a),
        .b(b),
        .c(c),
        .out_gate_delay(out_gate_delay),
        .out_mtm_delay(out_mtm_delay),
        .out_rf_delay(out_rf_delay),
        .out_netd_delay(out_netd_delay),
        .out_reg_delay(out_reg_delay)
    );

    // Clock generation
    always #5 p = ~p; // Generate a 10ns clock
    always #7 q = ~q; // Generate a 14ns clock

    // Stimulus
    initial begin
        p = 0;
        q = 0;
        #10 p = 1;
        #20 q = 1;
        #30 p = 0;
        #40 q = 0;
        #50;
    end

    // Monitor
    always @(posedge p or posedge q) begin
        $display("At time %t, a=%0d, b=%0d, c=%0d", $time, a, b, c);
        $display("At time %t, out_gate_delay=%0d, out_mtm_delay=%0d, out_rf_delay=%0d", $time, out_gate_delay, out_mtm_delay, out_rf_delay);
        $display("At time %t, out_netd_delay=%0d, out_reg_delay=%0d", $time, out_netd_delay, out_reg_delay);
    end

endmodule