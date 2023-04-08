module pipeline_shif #(
    parameter N=15
    )(
    input  clk,
    input  a,
    output y
    );

    reg [N-1:0] temp;
    always@(posedge clk) begin
        temp [0] <= a;
    end

    genvar i;

    generate
        begin
            for (i = 1; i < N; i = i + 1) begin
                always@(posedge clk) begin
                    temp[i] <= temp[i-1]; 
                end
            end
        end
    endgenerate

    assign y = temp [N-1];
    
endmodule