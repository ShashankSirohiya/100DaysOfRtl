module CLA_adder_tb;
    
    reg [3:0] a, b;
    wire [3:0] sum;
    
    CLA_adder uut(.a(a),
       			  .b(b),
       			  .sum(sum));
    
    initial begin
        $display("Testing Carry Look-Ahead Adder");
        $display("---------------------------");
        
        a = 4'b0000; b = 4'b0000; #1; $display("a=%b, b=%b, sum=%b", a, b, sum);
        a = 4'b0001; b = 4'b0010; #1; $display("a=%b, b=%b, sum=%b", a, b, sum);
        a = 4'b1111; b = 4'b0001; #1; $display("a=%b, b=%b, sum=%b", a, b, sum);
        a = 4'b1101; b = 4'b0011; #1; $display("a=%b, b=%b, sum=%b", a, b, sum);
        
        $finish;
    end
    
endmodule
