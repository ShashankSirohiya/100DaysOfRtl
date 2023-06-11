
class parent;
// bit [3:0] a=2; //by default it is public
// bit [3:0] b=3;

// local bit [3:0] a=2;
// local bit [3:0] b=3;

   protected bit [3:0] a=2;
   protected bit [3:0] b=3;


 function void print();
  $display("a=%d b=%d", a,b);
 endfunction
endclass

class child extends parent;
  bit [3:0] c;

 function void add;
 c=a+b;
 $display("c=%d",c);
 endfunction

endclass

module tb;
 child c;
 bit [3:0] d;

 initial begin
 c = new();
 c.print();
 c.add();
 //d=c.b-c.a;          //example for protected layer
 //$display("d=%d",d); 
end
endmodule

