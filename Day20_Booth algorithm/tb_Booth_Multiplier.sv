module tb_Booth_Multiplier;
  wire [7:0] Y;
  reg [3:0] A, B;
  
  Booth_Multiplier dut(Y, A, B);
  
  initial
  begin

    $display("RSLT\tA x B = Y");                    //Results comes in signed fixed number 
    A = 2; B = 2; #10;                              //but if it comes in unsigned number so 
    if ( Y == 4 )                                   //the answer is also correst but in that 
      $display("PASS\t%p x %p = %p",A,B,Y);         //case transcript shows fail.
    else
      $display("FAIL\t%p x %p = %p",A,B,Y);
    
    
    A = 3; B = 4; #10;
    if ( Y == 12 )
      $display("PASS\t%p x %p = %p",A,B,Y);
    else
      $display("FAIL\t%p x %p = %p",A,B,Y);
    
    A = 3; B = -4; #10;
    if ( Y == -12 )
      $display("PASS\t%p x %p = %p",A,B,Y);
    else
      $display("FAIL\t%p x %p = %p",A,B,Y);
    
    
    A = 0; B = 0; #10;
    if ( Y == 0 )
      $display("PASS\t%p x %p = %p",A,B,Y);
    else
      $display("FAIL\t%p x %p = %p",A,B,Y);
    
    
    A = 15; B = 15; #10;
    if ( Y == 225 )
      $display("PASS\t%p x %p = %p",A,B,Y);
    else
      $display("FAIL\t%p x %p = %p",A,B,Y);
    
  end
  
endmodule : tb_Booth_Multiplier