module elevator(
    output reg [7:0] seg_led,
    output [3:0] seg,
    output [1:0] floor_out,
    input clk,
    input rst,
    input [1:0] floor
    );

    parameter FG = 2'b00, F1 = 2'b01, F2 = 2'b10, F3 = 2'b11;
    reg [1:0] pst, nst;
    reg [25:0] count;

    assign seg = 4'hE;
    assign floor_out = floor;

    always @(posedge clk or posedge rst) begin
        if(rst) begin
            pst <= FG;
            count <= 0;
        end else begin
            count <= count + 1;
            if(&count) pst <= nst;
        end
    end

    always @(*) begin
        case (pst)
            FG  :   begin
                        case (floor)
                            FG      :   nst = FG;
                            default :   nst = F1;
                        endcase
                    end
            F1  :   begin
                        case (floor)
                            FG      :   nst = FG;
                            F1      :   nst = F1;
                            default :   nst = F2;
                        endcase
                    end
            F2  :   begin
                        case (floor)
                            F2      :   nst = F2;
                            F3      :   nst = F3;
                            default :   nst = F1;
                        endcase
                    end
            F3  :   begin
                        case (floor)
                            F3      :   nst = F3;
                            default :   nst = F2;
                        endcase
                    end
        endcase
    end

    always @(*) begin
        case (pst)
            FG   :  seg_led = 8'h42;
            F1   :  seg_led = 8'h9E;
            F2   :  seg_led = 8'h24;
            F3   :  seg_led = 8'h0C;
        endcase
    end
endmodule