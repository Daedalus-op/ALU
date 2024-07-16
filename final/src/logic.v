module ands #(
    parameter N = 4
) (
    input  [N - 1:0] a,
    input  [N - 1:0] b,
    output [N - 1:0] y
);
  genvar i;
  for (i = 0; i < N; i = i + 1) begin
    and (y[i], a[i], b[i]);
  end
endmodule

module ors #(
    parameter N = 4
) (
    input  [N - 1:0] a,
    input  [N - 1:0] b,
    output [N - 1:0] y
);
  genvar i;
  for (i = 0; i < N; i = i + 1) begin
    or (y[i], a[i], b[i]);
  end
endmodule

module nots #(
    parameter N = 4
) (
    input  [N - 1:0] a,
    output [N - 1:0] y
);
  genvar i;
  for (i = 0; i < N; i = i + 1) begin
    not (y[i], a[i]);
  end
endmodule
