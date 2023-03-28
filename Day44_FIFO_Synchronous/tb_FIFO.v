module fifo_tb;

   // Parameters
   localparam WIDTH = 8;
   localparam DEPTH = 16;

   // Inputs
   reg clk;
   reg rst;
   reg wr_en;
   reg rd_en;
   reg [WIDTH-1:0] wr_data;

   // Outputs
   wire [WIDTH-1:0] rd_data;
   wire empty;
   wire full;

   // Instantiate the FIFO module
   fifo #(
      .WIDTH(WIDTH),
      .DEPTH(DEPTH)
   ) dut (
      .clk(clk),
      .rst(rst),
      .wr_en(wr_en),
      .rd_en(rd_en),
      .wr_data(wr_data),
      .rd_data(rd_data),
      .empty(empty),
      .full(full)
   );

   // Clock generation
   always #5 clk = ~clk;

   // Stimulus
    initial 
    begin
    	  clk = 0;
	      rst = 1;
	      wr_en = 0;
	      rd_en = 0;
	      wr_data = 0;
	      #20 rst = 0;
	      #10 wr_en = 1; wr_data = 1;
	      #10 wr_en = 1; wr_data = 2;
	      #10 wr_en = 1; wr_data = 3;
	      #10 rd_en = 1;
	      #10 rd_en = 1;
	      #10 wr_en = 1; wr_data = 4;
	      #10 wr_en = 1; wr_data = 5;
	      #10 $finish;
    end

   // Monitor
   always @(posedge clk) begin
      $display("RD Data: %d, Empty: %d, Full: %d", rd_data, empty, full);
   end

endmodule 