module ands #(
    parameter N = 4
) (
    input logic  [N - 1:0] a,
    input logic  [N - 1:0] b,
    output logic [N - 1:0] y
);
  genvar i;
  for (i = 0; i < N; i = i + 1) begin
    and (y[i], a[i], b[i]);
  end
endmodule

module ors #(
    parameter N = 4
) (
    input logic  [N - 1:0] a,
    input logic  [N - 1:0] b,
    output logic [N - 1:0] y
);
  genvar i;
  for (i = 0; i < N; i = i + 1) begin
    or (y[i], a[i], b[i]);
  end
endmodule

module xors #(
    parameter N = 4
) (
    input logic  [N - 1:0] a,
    input logic  [N - 1:0] b,
    output logic [N - 1:0] y
);
  genvar i;
  for (i = 0; i < N; i = i + 1) begin
    xor (y[i], a[i], b[i]);
  end
endmodule
