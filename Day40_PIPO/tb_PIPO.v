module pipo_tb;
    reg clk;
    reg rst;
    reg in1;
    reg in2;
    reg in3;
    reg in4;
    
    wire y1;
    wire y2;
    wire y3;
    wire y4;
    
    pipo uut(
        .clk(clk),
        .rst(rst),
        .in1(in1),
        .in2(in2),
        .in3(in3),
        .in4(in4),
        .y1(y1),
        .y2(y2),
        .y3(y3),
        .y4(y4)
        );
        
        initial
            begin  
                clk=0;
                rst=1;
                in1=0;
                in2=0;
                in3=0;
                in4=0;
                
                #20 rst=0;
            end            
         
        always
            begin
            
                in1=$random;
                in2=$random;
                in3=$random;
                in4=$random;
                #50;
            end

        always #5 clk=~clk;
        
endmodule