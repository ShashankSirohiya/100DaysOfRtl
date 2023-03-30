module asynchronous_rom_tb;

reg [2:0] address;
wire [15:0] data;

asynchronous_rom dut (
    .address(address),
    .data(data)
);

initial begin
    // test some memory locations
    address = 3'b000;
    #10;
    $display("Data at address %h is %h", address, data);

    address = 3'b001;
    #10;
    $display("Data at address %h is %h", address, data);

    address = 3'b110;
    #10;
    $display("Data at address %h is %h", address, data);

    address = 3'b111;
    #10;
    $display("Data at address %h is %h", address, data);

    $display("All tests completed.");
    $finish;
end

endmodule