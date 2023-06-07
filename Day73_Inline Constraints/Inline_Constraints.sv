class test;
   rand bit [3:0] var1;

   constraint c1 { var1>3 && var1<7;};

   //constraint c2 { var == 5;}; //not allowed for doing this we use inline constraint "with"
endclass
  

module tb;
   test t;

   initial begin
    t = new();
    repeat(10)begin
    t.randomize with {var1 == 5;};
    $display("var1=%d", c.var1);
   end
 end
endmodule
