module tb_ram;

    // Inputs
    reg clk = 0;
    reg ce1;
    reg ce2;
    reg we;
    reg oe;
    reg [12:0] addr;
    reg [7:0] datain;
    
    // Outputs
    wire [7:0] dataout;
    
    // Instantiate RAM module
    ram dut (
        .clk(clk),
        .ce1(ce1),
        .ce2(ce2),
        .we(we),
        .oe(oe),
        .addr(addr),
        .datain(datain),
        .dataout(dataout)
    );
    
    // Clock generation
    always #5 clk = ~clk;
    
    // Initial stimulus
    initial begin
        // $dumpfile("tb_ram.vcd");
        // $dumpvars(0, tb_ram);
        // $display("Start simulation...");
        clk = 0;
        ce1 = 0;
        ce2 = 0;
        we = 0;
        oe = 0;
        addr = 0;
        datain = 0;
        #10 ce1 = 1; // Enable CE1
        #20 ce2 = 1; // Enable CE2
        #30 we = 1; // Write data
        #40 we = 0; // Disable write
        #50 oe = 1; // Read data
        #60 oe = 0;
        #60 addr = 1; // Change address
        #70 datain = 8'hAA; // Change data input
        #80 we = 1; // Write data again
        #90 we = 0; // Disable write
        #100 oe = 1;
        #100 oe = 0;
       // #100 $finish; // End simulation
    end
endmodule