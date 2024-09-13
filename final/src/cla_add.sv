`include "./cla.v"

module cla_add #(
    parameter N = 4
) (
    a,
    b,
    s,
    ovf
);

  input [N-1:0] a, b;
  output [N-1:0] s;
  output ovf;
  wire [N/4:0] c;
  assign c[0] = 0;
  genvar i;
  for (i = 0; i < N; i = i + 4) begin
    cla u1 (
        a[(3+i):i],
        b[(3+i):i],
        c[i/4],
        s[(3+i):i],
        c[i/4+1]
    );
  end
  assign ovf = c[N/4];

endmodule
