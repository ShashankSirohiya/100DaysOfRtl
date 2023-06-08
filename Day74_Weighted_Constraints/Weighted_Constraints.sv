class test;
  rand bit[3:0] var1;

  constraint c1 {var1 dist{5:=3, 2:=6, 7:=3};};
endclass

module tb;
  test t;

  initial begin
   t = new();
   repeat(10)begin
   t.randomize();
   $display("var1=%d", t.var1);
   end
  end

endmodule
