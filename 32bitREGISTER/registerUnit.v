module REGISTER_UNIT(D,Q,R_W);
    // D FLIP-FLOP
    input D;
    output reg Q;
    // Enable Write
    input R_W;

    always @(posedge R_W)
    begin
        // Write into D Flip-Flop
        if (R_W == 1)
            Q <= D;
    end
endmodule