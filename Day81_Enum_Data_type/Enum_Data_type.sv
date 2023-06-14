// Code your testbench here
// or browse Examples

module tb;
  //enum{start=5,addr,data,stop}packet;
  //enum{addr[4]}packet;
  //enum{addr[3:5]}packet;
  //enum{addr[3:5]=6}packet;

  enum{start,addr,data,stop}packet;
  
	initial begin
	packet = packet.first;
      $display("The first element is %s and the value is %0d",packet.name(),packet);

	packet = packet.last;
      $display("The last element is %s and the value is %0d",packet.name(),packet);

	packet = packet.next;
      $display("The next element is %s and the value is %0d", packet.name(),packet.next());

	packet = packet.prev;
      $display("The previous element is %s and the value is %0d",packet.name(),packet.prev());

      $display("The number of elements is %0d",packet.num());

	end
endmodule