class test;

 //rand bit[3:0] a;
 //rand bit[3:0] b;

 randc bit[3:0] a;
 randc bit[3:0] b;

 constraint c1{
   a>2 && a<10;
     b>3 && b<11;
	}
endclass

module tb;
  test t;

  initial begin
    t = new();
    repeat(10)begin
    t.randomize();
    $display("a=%d b=%d", t.a, t.b);   
   end
 end
endmodule
