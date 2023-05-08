module tb_prime_number_detector;
  reg [31:0] number;
  wire is_prime;

  prime_number_detector dut(.number(number), .is_prime(is_prime));

  initial begin
    // Test case 1: Prime number (13)
    number = 13;
    #10;
    
    // Test case 2: Non-prime number (20)
    number = 20;
    #10;

    // Test case 2: prime number (20)
    number = 11;
    #10;

    // Test case 2: prime number (20)
    number = 18;
    #10;

    // Add more test cases here

    $finish;
  end

  always @(posedge is_prime) begin
    $display("Number %d is %s", number, (is_prime) ? "prime" : "not prime");
  end
endmodule
