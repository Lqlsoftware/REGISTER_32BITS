`timescale 1ns / 1ps

module DECODER_5BIT(IN,OUT,SELECT);
    input [1023:0] IN;
    output [31:0] OUT;
    input [4:0] SELECT;
    wire [1:0] a,b,c,d,e;
    wire [31:0] sel;
    assign a[0] = SELECT[4];
    assign b[0] = SELECT[3];
    assign c[0] = SELECT[2];
    assign d[0] = SELECT[1];
    assign e[0] = SELECT[0];
    not (a[1],a[0]);
    not (b[1],b[0]);
    not (c[1],c[0]);
    not (d[1],d[0]);
    not (e[1],e[0]);
    
    generate
        genvar i;
        genvar j;
        for (i=0; i<32; i=i+1) begin : andUnit
            and andGate(sel[i],a[(i/16)%2],b[(i/8)%2],c[(i/4)%2],d[(i/2)%2],e[i%2]);
            for (j=0; j<32; j=j+1) begin : triUnit
                bufif1 buffGate(OUT[j],IN[i*32+j],sel[31-i]);
            end
        end
    endgenerate

endmodule