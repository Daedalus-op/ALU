module rca (
  input logic a,b,cin,
  output logic s,cout
);
  logic p,g;
  assign p = a^b;
  assign g = a&b;
  assign s = p^cin;
  assign cout = g|cin&p;

endmodule


module rca_add #(
    parameter N = 4
) (
    input logic [N-1:0] a,
    input logic [N-1:0] b,
    output logic [N-1:0] s,
    output logic ovf
);

  logic [N:0] c;
  assign c[0] = 0;
  genvar i;
  for (i = 0; i < N; i = i + 1) begin
    rca u1 (a[i], b[i], c[i], s[i], c[i+1]);
  end
  assign ovf = c[N];
endmodule