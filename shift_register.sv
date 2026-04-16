module shift_register #(
    parameter DIRECTION = 1 // MSB = 1, LSB = 0
)(
    input  logic        clk,
    input  logic        rst,
    input  logic        data,
    input  logic        wr_en,
    output logic [31:0] out
);

    always_ff @(posedge clk) begin
        if (rst) begin
            // Synchronous reset to 0
            out <= 32'b0;
        end else if (wr_en) begin
            if (DIRECTION == 1) begin
                // MSB Direction: Data enters at bit 31, rest shifts Right
                out <= {data, out[31:1]};
            end else begin
                // LSB Direction: Data enters at bit 0, rest shifts Left
                out <= {out[30:0], data};
            end
        end
    end

endmodule