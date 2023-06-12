class parent;

 virtual function void print();
  $display("We are inside the parent class");
 endfunction
 
endclass

class child extends parent;

  function void print();
  $display("We are inside the child class");
  endfunction

endclass

module tb;
  parent p;
  child c;

 initial begin
 p = new();
 c = new();
 p = c;          //for accessing child class from parent class use "virtual keyword" which comes under polymorphism      
 p.print();       //we can't do (c=p) because of inheritance
 c.print();    
 end
endmodule

