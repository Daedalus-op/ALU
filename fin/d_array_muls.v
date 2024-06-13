module array_mul #(parameter N=2) (
  input clk,
  input en,
  input [N - 1:0] a,
  input [N - 1:0] b,
  inout [2 * N - 1:0] y
);

wire [N - 1:0] pp [N - 1:0]; //partial products
wire [2 * N - 1:0] pp1 [N - 1:0]; // Shifted partial products

wire [2 * N - 1:0] to_reg; // feed from output register
reg [2 * N - 1:0] from_reg = 4'd0; // feed from output register

reg [N - 1:0] ct = 0;

genvar i;
// Partial products
for (i = 0; i < N; i = i + 1) begin
  ands #(N) u1({N{a[i]}}, b, pp[i]); // Creating partial products
  assign pp1[i] = {{N{1'b0}},pp[i]} << i; // Shifting partial products
end

always @(posedge en) begin
  from_reg <= 0;
  ct <= 0;
end
// Summing of partial products
// rca_add #(2 * N) ub(pp1[en], pp1[en - 1], y, _);
always @(posedge clk) begin
  if(ct < N) begin
    from_reg <= from_reg + pp1[ct];
    ct <= ct + 1;
  end
end
assign y = from_reg;

endmodule
