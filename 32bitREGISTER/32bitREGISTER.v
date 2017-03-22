module REGISTER_32BITS(Read_Register1,Read_Data1,Read_Register2,Read_Data2,Write_Register,Write_Data,Reg_Write);
    // Read Address 1
    input [4:0] Read_Register1;
    // Read Output 1
    output [31:0] Read_Data1;
    // Read Address 2
    input [4:0] Read_Register2;
    // Read Output 1
    output [31:0] Read_Data2;
    // Write Address
    input [4:0] Write_Register;
    // Write input 1
    input [31:0] Write_Data;
    // Enable Write
    input Reg_Write;

    // Read Address 1 DECODED
    wire [31:0] readAddress1;
    // Read Address 2 DECODED
    wire [31:0] readAddress2;
    // Write Address DECODED
    wire [31:0] writeAddress;

    // 5-32 DECODER
    DECODER_5BIT DecoderRead1(Read_Register1,readAddress1);
    DECODER_5BIT DecoderRead2(Read_Register2,readAddress2);
    DECODER_5BIT DecoderWrite(Write_Register,writeAddress);

    // Generate RegUnit Connected to Decoder
    generate
        genvar i;
        for (i=0; i<32; i=i+1) begin : regUnit0
            REGISTER_32BIT REGUNIT_32BIT(Read_Data1,Read_Data2,Write_Data,Reg_Write,readAddress1[i],readAddress2[i],writeAddress[i]);
        end
    endgenerate
endmodule