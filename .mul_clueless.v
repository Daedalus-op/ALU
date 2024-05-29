module mul(a, b, t1, t2);
input [1:0] a;
input [1:0] b;
//output [3:0] pro;

output reg [2:0] t1;
output reg [2:0] t2;
always @* begin
  t1 = b;
  t2 = b << 1;
end
//rca_add #(3) unit(t2 , t1, pro);

//assign c = (t2 << 1) + t1;

endmodule
