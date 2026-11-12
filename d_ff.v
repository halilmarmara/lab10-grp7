module d_ff(
    input clk,
    input reset,
    input d,
    output reg q,
    output q_n
);
    initial q <= 1'b0;

    always @(posedge clk, posedge reset) begin
        if (reset)
            q <= 1'b0;
        else
            q <= d;
    end

    assign q_n = ~q;
endmodule