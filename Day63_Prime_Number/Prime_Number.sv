module prime_number_detector(input [31:0] number, output reg is_prime);
  reg [31:0] i;

  always @(*) begin
    is_prime = 1;
    if (number <= 1)
      is_prime = 0;
    else begin
      for (i = 2; i <= number / 2; i = i + 1) begin
        if (number % i == 0) begin
          is_prime = 0;
          break;
        end
      end
    end
  end
endmodule

