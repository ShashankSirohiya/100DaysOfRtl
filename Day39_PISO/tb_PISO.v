module piso_tb;
    
    reg inA;                    // inputs
    reg inB;
    reg inC;
    reg inD;
    reg clk;
    reg rst;
    reg s_l;
    
    wire q;                     //outputs
    
    piso uut(
        .inA(inA),
        .inB(inB),
        .inC(inC),
        .inD(inD),
        .clk(clk),
        .rst(rst),
        .s_l(s_l),
        .q(q)
        );
        
    initial                          
        begin
            inA=0;
            inB=0;
            inC=0;
            inD=0;
            s_l=0;
            rst=1;
            clk=0;
        #10 rst=0;

        #10 s_l=1;
                
        #10 inA=1;
            inB=1;
            inC=1;
            inD=1;
            s_l=0;
        end      
    
    always                         
        begin      
            inA=$random;
            inB=$random;
            inC=$random;
            inD=$random;
            s_l=$random;
            #50;     
        end
	 
	 always #10 clk=~clk; 

endmodule