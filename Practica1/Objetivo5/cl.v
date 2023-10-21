module cl(output wire out, input wire a, b, input wire [1:0] S);

    wire cand, cor, cxor, cnot;

    and and1(cand, a, b);
    or or1(cor, a, b);
    xor xor1(cxor, a, b);
    not not1(cnot, a);

    mux4_1 mux(out, cand, cor, cxor, cnot, S);

endmodule