class test;
   randc bit[3:0] var1;

   constraint c1 {var1 inside {[0:7]};};  //{var1 inside {1,2,4,7,10,[11:15]};};  
endclass

module tb;
   test t;

  initial begin 
   t = new();
   repeat(10)begin
   t.randomize();
    if(t.var1 inside {[0:3]})
   $display("var1=%d", t.var1);
  end
  end
endmodule



//---------constraint[inside_keyword]--------------

class test;
   rand bit a;
   rand bit[3:0] b;

  constraint c1 {(a==1)->(b==4);
	solve a before b;
		};
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

//---------Solve before constraint----------------
