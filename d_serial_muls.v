module ser_mul #(parameter N=4) (
  input clk,
  input en,
  input [N - 1:0] a,
  input [N - 1:0] b,
  inout reg [2 * N - 1:0] y
);
wire [N - 1:0] pp;
wire [2 * N - 1:0] from_reg;

ands #(N) u1(a, b, pp);
rca_add #(2 * N) u3(pp, from_reg, y, _);
shift #(2 * N) u2(1'b1, clk, en, y, from_reg);

endmodule
