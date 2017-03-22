module DECODER_5BIT(SELECT,OUT);
    // Selected Address
    input [4:0] SELECT;
    // Output Signal
    output [31:0] OUT;
    
    wire [1:0] a,b,c,d,e;
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
    
    // Add AND gate to each address
    generate
        genvar i;
        for (i=0; i<32; i=i+1) begin : andUnit
            and andGate(OUT[i],a[(i/16)%2],b[(i/8)%2],c[(i/4)%2],d[(i/2)%2],e[i%2]);
        end
    endgenerate

endmodule