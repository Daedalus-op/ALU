module mul(a, b, pro);
input [1:0] a;
input [1:0] b;
output [3:0] pro;

wire reg [2:0] p1;
wire reg [2:0] p2;
always @* begin
  p1 = a & {b[0],b[0]};
  p2 = (a & {b[1],b[1]}) << 1;
end
rca_add #(3) unit(t2 , t1, pro);

//assign c = (t2 << 1) + t1;

endmodule
