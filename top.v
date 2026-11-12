module top(
    input [3:0] sw,
    input btnC,
    output [5:0] led
);
    d_ff  u_d  (.clk(btnC), .reset(1'b0), .d(sw[0]),
                .q(led[0]), .q_n(led[1]));

    jk_ff u_jk (.clk(btnC), .reset(1'b0), .j(sw[1]), .k(sw[2]),
                .q(led[2]), .q_n(led[3]));

    t_ff  u_t  (.clk(btnC), .reset(1'b0), .t(sw[3]),
                .q(led[4]), .q_n(led[5]));
endmodule