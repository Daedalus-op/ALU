
module add #(parameter N=4) (
a,b,s,ovf);

  input [N-1:0] a,b;
  output [N-1:0] s;
  output ovf;
  wire [N:0]c;
  assign c[0]=0;
  genvar i;
  for(i = 0; i < N; i = i + 1) begin
    fa u1(a[i],b[i],c[i],s[i],c[i+1]);
  end
  assign ovf = c[N];

endmodule
