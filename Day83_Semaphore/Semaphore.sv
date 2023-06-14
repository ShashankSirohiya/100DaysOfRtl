module tb;
	semaphore key=new(1);

	initial begin
		repeat(2)

		fork
		  begin
			$display("[A] process A is trying to get the key %0t",$time);
		  key.get(1);
			$display("[A] process A got the key %0t",$time);
		  #10;
		  key.put(1);
			$display("[A] process A has drop the key %0t",$time);
		  #10;
		  end

		  begin
			$display("[B] process B is trying to get the key %0t",$time);
		  key.get(1);
			$display("[B] process B got the key %0t",$time);
		  #10;
	          key.put(1);
			$display("[B] process B has drop the key %0t",$time);
		  #10;  
		end
		join	

		end
endmodule