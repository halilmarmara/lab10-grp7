module t_ff(
    input clk,
    input reset,
    input t,
    output q,
    output q_n
);
    jk_ff jk (
        .clk(clk),
        .reset(reset),
        .j(t),
        .k(t),
        .q(q),
        .q_n(q_n)
    );
endmodule