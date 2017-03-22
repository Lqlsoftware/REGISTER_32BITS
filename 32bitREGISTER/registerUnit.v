`timescale 1ns / 1ps

module REGISTER_UNIT(D,Q,R_W);
    input D;
    output reg Q;
    input R_W;

    reg clk;
    initial
        clk = 0;
    always
        #1 clk = ~clk;

    always @(posedge clk)
    begin
        if (R_W == 1)
            Q <= D;
    end
endmodule