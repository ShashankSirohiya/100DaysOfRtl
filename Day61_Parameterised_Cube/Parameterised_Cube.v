module cube #(
    parameter width = 4,
    parameter pipeline_width = 9
    ) (
    input  [  width-1:0] in,
    input                clk,
    input                rst_n,
    output [3*width-1:0] out
    );

    reg  [  width-1:0] in_reg;
    wire [2*width-1:0] sq_temp;
    reg  [3*width-1:0] pipe [pipeline_width-1:0];
    reg  [3*width-1:0] out_reg;

    assign sq_temp = in_reg*in_reg; // square of two digits stores in sq_temp

    always @(posedge clk or negedge rst_n) begin
        if(~rst_n) begin
            in_reg <= 0;
            pipe[0] <= 0;
        end else begin
            in_reg <= in;
            pipe [0] <= {sq_temp, in_reg};
        end
    end

    assign out = out_reg;

    genvar i;
    generate
        begin
            if(pipeline_width == 1) begin
                always@(posedge clk, negedge rst_n) begin
                    if (~rst_n) begin
                        out_reg <= 0;
                    end else begin
                        out_reg <= pipe [0][width-1:0] * pipe [0][3*width-1:width];
                    end
                end
            end else begin
                for (i = 1; i < pipeline_width; i=i+1) begin
                    if (i == pipeline_width-1) begin
                        always @(posedge clk or negedge rst_n) begin
                            if(~rst_n) begin
                                out_reg <= 0;
                            end else begin
                                out_reg <= pipe[i-1];
                            end
                        end
                    end else if (i == 1) begin
                        always @(posedge clk or negedge rst_n) begin
                            if(~rst_n) begin
                                pipe[1] <= 0;
                            end else begin
                                pipe[1] <= pipe [0][width-1:0] * pipe [0][3*width-1:width];
                            end
                        end
                    end else begin
                        always @(posedge clk, negedge rst_n) begin
                            if (~rst_n) begin
                                pipe[i] <= 0;
                            end else begin
                               pipe [i]  <= pipe [i-1]; 
                            end
                        end
                    end
                end 
            end
        end
    endgenerate
endmodule




///////////////////////////////////////////////////////////////////////////////////////////////////////////

//               ___________________________________________
//              |                                           |
//    in ----->|                Design                       |
//              |                                           |
//    clk ---->|                                           |
//              |                ________________________     |
//    rst_n --->|_______|        |                      |    |
//              |       |------->|     Combinational    |    |
//    width ---->|       | sq_temp|         Logic        |    |
//              |       |<-------|                      |    |
//    pipeline_width -->|        |______________________|    |
//              |       |      |        ____________________  |
//    out <-----|       |<-----|       |    Register       | |
//              |_______| out_reg|       |    File (RF)     | |
//                                 |______________________| |
//              |___________________________________________|


// In the above design, the input in signal is multiplied with itself (sq_temp = in_reg * in_reg) in the combinational 
// logic block. The output of the combinational logic, sq_temp, is then stored in a pipeline register array pipe. 
// The pipeline register array pipe holds pipeline_width number of registers, and their contents are shifted to the 
// right in each clock cycle. The in_reg register holds the current value of in signal, and it is updated with the 
// input value in each clock cycle (in_reg <= in). The out_reg register holds the output value of the design, and it 
// is updated with the value of the last register in the pipeline array (pipe[pipeline_width-1]) in each clock cycle 
// (out_reg <= pipe[pipeline_width-1]). The design also includes reset functionality, which sets in_reg, pipe[0], 
// and out_reg to 0 when the reset signal rst_n is active-low.