module cla (
  input logic [3:0] a, b,
  input logic cin,
  output logic [3:0] sum,
  output logic cout
);

  wire p0, p1, p2, p3;
  wire g0, g1, g2, g3;
  wire c0, c1, c2, c3;

  assign p0 = a[0] ^ b[0];
  assign p1 = a[1] ^ b[1];
  assign p2 = a[2] ^ b[2];
  assign p3 = a[3] ^ b[3];

  assign g0 = a[0] & b[0];
  assign g1 = a[1] & b[1];
  assign g2 = a[2] & b[2];
  assign g3 = a[3] & b[3];

  assign c0 = g0 | (p0 & cin);
  assign c1 = g1 | (p1 & (g0 | (p0 & cin)));
  assign c2 = g2 | (p2 & (g1 | (p1 & (g0 | (p0 & cin)))));
  assign c3 = g3 | (p3 & (g2 | (p2 & (g1 | (p1 & (g0 | (p0 & cin)))))));
  assign cout = c3;

  assign sum[0] = p0 ^ cin;
  assign sum[1] = p1 ^ c0;
  assign sum[2] = p2 ^ c1;
  assign sum[3] = p3 ^ c2;


endmodule


module cla_add #(
    parameter N = 4
) (
  input logic [N-1:0] a, b,
  output logic [N-1:0] s,
  output logic ovf
);

  logic [N/4:0] c;
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
