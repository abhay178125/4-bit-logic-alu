`timescale 1ns/1ps

module alu_tb;
    reg  [3:0] a;
    reg  [3:0] b;
    reg  [2:0] op;
    wire [3:0] result;
    wire zero;

    integer errors = 0;

    alu dut (
        .a(a),
        .b(b),
        .op(op),
        .result(result),
        .zero(zero)
    );

    task check_result;
        input [3:0] expected;
        begin
            #1;
            if (result !== expected) begin
                $display("FAIL: op=%b a=%h b=%h result=%h expected=%h",
                         op, a, b, result, expected);
                errors = errors + 1;
            end else begin
                $display("PASS: op=%b a=%h b=%h result=%h",
                         op, a, b, result);
            end
        end
    endtask

    initial begin
        $dumpfile("alu_wave.vcd");
        $dumpvars(0, alu_tb);

        a = 4'd3; b = 4'd2; op = 3'b000; check_result(4'd5);
        op = 3'b001; check_result(4'd1);
        op = 3'b010; check_result(4'd2);
        op = 3'b011; check_result(4'd3);
        op = 3'b100; check_result(4'd1);
        op = 3'b101; check_result(4'b1100);
        op = 3'b110; check_result(4'd0);
        op = 3'b111; check_result(4'd3);

        a = 4'd1; b = 4'd7; op = 3'b110; check_result(4'd1);
        a = 4'd0; b = 4'd0; op = 3'b000; check_result(4'd0);

        if (errors == 0)
            $display("ALL ALU TESTS PASSED");
        else
            $display("ALU TESTS FAILED: %0d error(s)", errors);

        $finish;
    end
endmodule
