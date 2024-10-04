`include "logic.v"
`include "rca_add.v"

module array_mul #(
    parameter N = 4
) (
    output logic [N - 1:0] y,
    input logic [N/2 - 1:0] a,
    input logic [N/2 - 1:0] b,
    input logic inp,
    input logic clk
);

  logic [N/2 - 1:0] pp[N/2 - 1:0];  // Partial products
  logic [N - 1:0] pps[N/2 - 1:0];  // Shifted partial products

  logic [N - 1:0] to_reg;  // Feed to adder module
  logic [N - 1:0] from_reg;  // Feed from output register
  logic [N - 1:0] from_pps;  // Feed from partial product arrays

  logic [N/2 - 1:0] ct = 0;  // Counter

  // Partial products
  genvar i;
  for (i = 0; i < N/2; i = i + 1) begin
    ands #(N/2) u1 ( {(N/2){a[i]}}, b, pp[i]);  // Creating partial products
    assign pps[i] = {{(N/2){1'b0}}, pp[i]} << i;  // Shifting partial products
  end

  // Interrupts
  always @(posedge inp) begin
    from_reg <= 0;
    from_pps <= pps[0];
    ct <= 0;
  end

  rca_add #(N) ua (from_reg, from_pps, to_reg, _);

  // Summing of partial products
  always @(posedge clk) begin
    if (ct < N/2) begin
      from_reg <= to_reg;
      from_pps <= pps[ct];
      ct <= ct + 1;
    end
  end
  assign y = from_reg;

endmodule
