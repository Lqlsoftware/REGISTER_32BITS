`timescale 1ns / 1ps

module REGISTER_UNIT_32BIT(D,Q,R_W);
    input [31:0] D;
    output [31:0] Q;
    input R_W;

    generate
        genvar i;
        for (i=0; i<32; i=i+1) begin : RegUnit
            REGISTER_UNIT UNIT(D[i],Q[i],R_W);
        end
    endgenerate
endmodule