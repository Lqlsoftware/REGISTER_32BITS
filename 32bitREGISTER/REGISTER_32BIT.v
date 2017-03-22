module REGISTER_32BIT(Read_Data1,Read_Data2,Write_Data,Reg_Write,readAddress1,readAddress2,writeAddress);
    // Read Output 1
    output [31:0] Read_Data1;
    // Read Output 1
    output [31:0] Read_Data2;
    // Write input 1
    input [31:0] Write_Data;
    // Enable Write
    input Reg_Write;
    // Read Address 1
    input readAddress1;
    // Read Address 2
    input readAddress2;
    // Write Address
    input writeAddress;

    // Enable Write Connected to Address
    wire EN_out;
    wire [31:0] D;
    wire [31:0] Q;

    // Connect Address to EN_Write
    and andGate_EN(EN_out,Reg_Write,writeAddress);

    // Generate a 32BITS-Register
    generate
        genvar j;
        for (j=0; j<32; j=j+1) begin : regUnit1
            // Generate 32 1BIT-Register
            REGISTER_UNIT UNIT(D[j],Q[j],EN_out);
            // Connect Address to Register
            bufif1 buffGate0(Read_Data1[j],Q[j],readAddress1);
            bufif1 buffGate1(Read_Data2[j],Q[j],readAddress2);
            bufif1 buffGate2(D[j],Write_Data[j],writeAddress);
        end
    endgenerate
endmodule