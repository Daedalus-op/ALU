module multiplier (
  input [3:0] a,b,
  output [7:0]product
);
  wire p[7:0], q[7:0], r[7:0], s[7:0];
  wire _;
  reg sum;
  assign p = 8'b0;
  assign sum = {7{1'b0}};
  genvar i;
  always begin
  for(i = 0; i < 4; i = i + 1) begin
     p[i] = a[i] & b[0];
  end
  //add #(7) u1(p, sum, sum, _ );
  sum = sum + p;
  for(i = 0; i < 4; i = i + 1) begin
     q[i] = a[i] & b[1];
  end
  sum = sum + p;
  //add #(7) u2(p<<1, sum, sum, _ );
  for(i = 0; i < 4; i = i + 1) begin
     r[i] = a[i] & b[2];
  end
  sum = sum + p;
  //add #(7) u3(p<<2, sum, sum, _ );
  for(i = 0; i < 4; i = i + 1) begin
    s[i] = a[i] & b[3];
  end
  sum = sum + p;
  //add #(7) u4(p<<3, sum, sum, _ );
end
  assign product = sum;

endmodule
