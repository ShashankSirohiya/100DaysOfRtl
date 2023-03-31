module Rom_Using_Case (
           input [2:0] address,
            input read_en,
            input ce,
            output reg [7:0] data_F1,
            output reg [7:0] data_F2,
            output reg [7:0] data_F3,
            output reg [7:0] data_F4
            );

            reg [7:0] data ;
  
      always @ (ce,read_en,address)
      begin
      case (address)
           3'b000 : begin
                 data_F1 = 0;
                 data_F2= 1;
                 data_F3=0;
                 data_F4=0;
                 end
           3'b001 : begin
                 data_F1=0;
                 data_F2=1;
                 data_F3=1;
                 data_F4=0;
                 end
           3'b010 : begin
                 data_F1=1;
                 data_F2=0;
                 data_F3=0;
                 data_F4=0;
                 end
           3'b011 : begin
                 data_F1=1;
                 data_F2=1;
                 data_F3=0;
                 data_F4=1;
                 end
           3'b100 : begin
                 data_F1 =0;
                 data_F2=0;
                 data_F3=1;
                 data_F4=0;
                 end
           3'b101 : begin
                 data_F1=0;
                 data_F2=0;
                 data_F3=0;
                 data_F4=1;
                 end
           3'b110:  begin
                 data_F1=1;
                 data_F2=1;
                 data_F3=0;
                 data_F4=1;
                 end
           3'b111:  begin
                 data_F1=1;
                 data_F2=0;
                 data_F3=1;
                 data_F4=1;
                 end
          
      endcase
      end
endmodule : Rom_Using_Case