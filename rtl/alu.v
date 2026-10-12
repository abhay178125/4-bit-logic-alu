module alu (
    input  wire [3:0] a,
    input  wire [3:0] b,
    input  wire [2:0] op,
    output reg  [3:0] result,
    output wire       zero
);

    always @* begin
        case (op)
            3'b000: result = a + b;                         // Addition
            3'b001: result = a - b;                         // Subtraction
            3'b010: result = a & b;                         // AND
            3'b011: result = a | b;                         // OR
            3'b100: result = a ^ b;                         // XOR
            3'b101: result = ~a;                            // NOT A
            3'b110: result = (a < b) ? 4'b0001 : 4'b0000;   // Less-than
            3'b111: result = a;                             // Pass A
            default: result = 4'b0000;
        endcase
    end

    assign zero = (result == 4'b0000);

endmodule
