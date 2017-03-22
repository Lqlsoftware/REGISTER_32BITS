`timescale 1ns / 1ps

module REGISTER_32BITS(Read_Register1,Read_Data1,Read_Register2,Read_Data2,Write_Register,Write_Data,Reg_Write);
    input [4:0] Read_Register1;
    output [31:0] Read_Data1;
    input [4:0] Read_Register2;
    output [31:0] Read_Data2;
    input [4:0] Write_Register;
    input [31:0] Write_Data;
    input Reg_Write;
    wire [1023:0] D;
    wire [1023:0] Q;
    // REGISTER 32*32BITS
    generate
        genvar i;
        for (i=0; i<32; i=i+1) begin : RegUnit_32BIT
            REGISTER_UNIT_32BIT UNIT_32BIT(D[(i + 1) * 32:i * 32],Q[(i + 1) * 32:i * 32],Reg_Write);
        end
    endgenerate
    // 5-32 DECODER
    DECODER_5BIT DecoderRead1(Q,Read_Data1,Read_Register1);
    DECODER_5BIT DecoderRead2(Q,Read_Data2,Read_Register2);
    DECODER_5BIT DecoderWrite(D,Write_Data,Write_Register);
endmodule