`include "logic.v"
`include "rca_add.v"

module array_mul #(
    parameter N = 4
) (
    input clk,
    input inp,
    input [N - 1:0] a,
    input [N - 1:0] b,
    inout [2 * N - 1:0] y
);

  wire [N - 1:0] pp[N - 1:0];  // Partial products
  wire [2 * N - 1:0] pps[N - 1:0];  // Shifted partial products

  wire [2 * N - 1:0] to_reg;  // Feed to adder module
  reg [2 * N - 1:0] from_reg;  // Feed from output register
  reg [2 * N - 1:0] from_pps;  // Feed from partial product arrays

  reg [N - 1:0] ct = 0;  // Counter

  genvar i;

  // Partial products
  for (i = 0; i < N; i = i + 1) begin
    ands #(N) u1 (
        {N{a[i]}},
        b,
        pp[i]
    );  // Creating partial products
    assign pps[i] = {{N{1'b0}}, pp[i]} << i;  // Shifting partial products
  end

  // Interrupts
  always @(posedge inp) begin
    from_reg <= 0;
    from_pps <= pps[0];
    ct <= 0;
  end

  rca_add #(2 * N) ua (
      from_reg,
      from_pps,
      to_reg,
      _
  );

  // Summing of partial products
  always @(posedge clk) begin
    if (ct < N) begin
      from_reg <= to_reg;
      from_pps <= pps[ct];
      ct <= ct + 1;
    end
  end
  assign y = from_reg;

endmodule
