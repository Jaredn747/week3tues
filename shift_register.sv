module shift_register #(parameter DIRECTION = 0) 
(
    input clk,
    input rst,
    input data,
    input wr_en,
    output[31:0] out
);

    reg [31:0] register;
    assign out = register;

    always @(posedge clk) begin
        if (rst) begin
            register <= 32'b0;
        end else if (wr_en) begin
            if (DIRECTION) 
                register <= {data, out[31:1]}; // go the right
            else
                register <= {out[30:0], data}; //go the left
            
        end
    end

endmodule