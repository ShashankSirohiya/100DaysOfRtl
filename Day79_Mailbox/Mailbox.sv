// Code your testbench here
// or browse Examples

module tb;

 mailbox mail=new();

    initial begin 
        bit [3:0] a;
      for(int i=0; i<5; i++)begin
        a=$random;
   
        mail.put(a);
        $display("data send is %0d", a);
        end
    end

    initial begin 
        forever begin
        bit [3:0] a;
   
        mail.get(a);
        $display("data received is %0d", a);
        end
    end

endmodule