module tb_Rom_Using_Case;
    reg [2:0]addr;
    reg r_en;
    reg chip_en;
    wire [7:0]data_F1;
    wire [7:0]data_F2;
    wire [7:0]data_F3;
    wire [7:0]data_F4;

    Rom_Using_Case uut0(.address(addr),
                        .read_en(r_en),
                        .ce(chip_en),
                        .data_F1(data_F1),
                        .data_F2(data_F2),
                        .data_F3(data_F3),
                        .data_F4(data_F4)                     
                            );                  
    initial
    begin
            r_en=0;
            addr=3'bx;
            chip_en=0;
        #20;
            r_en=1;
            addr=3'b000;
            chip_en=1;
        #20;
            addr=3'b001;
        #20;
            addr=3'b010;
        #20;
            addr=3'b011;
        #20;
            addr=3'b100;
        #20;
            addr=3'b101;
        #20;
            addr=3'b110;
        #20;
            addr=3'b111;
            $finish;
    end

endmodule : tb_Rom_Using_Case