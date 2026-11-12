module jk_ff(
    input clk,
    input reset,
    input j,
    input k,
    output q,
    output q_n
);
    wire d = (j & q_n) | (~k & q);

    d_ff dff (
        .clk(clk),
        .reset(reset),
        .d(d),
        .q(q),
        .q_n(q_n)
    );
endmodule