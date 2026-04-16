module shift_register #(parameter DIRECTION = 0) 
(
    input  logic        clk,
    input  logic        rst,
    input  logic        data,
    input  logic        wr_en,
    output logic [31:0] out
);

    always_ff @(posedge clk) begin
        if (rst) begin
            out <= 32'b0;
        end else if (wr_en) begin
            if (DIRECTION) begin
                out <= {data, out[31:1]}; // go the right
            end else begin
                out <= {out[30:0], data}; //go the left
            end
        end
    end

endmodule