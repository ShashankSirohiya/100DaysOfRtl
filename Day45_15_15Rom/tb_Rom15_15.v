module tb_Rom;

    reg clk;
    reg r_en;
    reg [3:0] addr;
    wire [15:0] data;
        

    Rom dut(
      .clk(clk),
      .r_en(r_en),
      .addr(addr),
      .data(data)
    );

    initial 
    begin
      // Initialize clock
      clk = 0;

      // Initialize memory
      dut.mem[0] = 16'h0000;
      dut.mem[1] = 16'h1111;
      dut.mem[2] = 16'hdead;
      dut.mem[3] = 16'hcafe;
      dut.mem[4] = 16'h4444;
      dut.mem[5] = 16'h5555;
      dut.mem[6] = 16'h6666;
      dut.mem[7] = 16'h7777;
      
      // Apply stimulus to address input
      addr = 0;
      r_en =0;
      #10 r_en = 1;
      #10 addr = 1;
      #10 addr = 2;
      #10 addr = 3;
      #10 addr = 4;
      #10 addr = 5;
      
      // Check output data
      #10 $display("Data at address 0 is %h", data);
      #10 $display("Data at address 1 is %h", data);
      #10 $display("Data at address 2 is %h", data);
      #10 $display("Data at address 3 is %h", data);
      
      // End simulation
      #10 $finish;
    end

    // Generate clock signal
    always #5 clk <= ~clk;

endmodule

