module divider #(parameter N = 4) (
  input clk,
  input inp,
  input [N - 1:0] a,
  input [N - 1:0] b,
  output [N / 2 - 1:0] y,
  output r
);

wire [3:0] pp; // Shifted partial products
wire [3:0] pps; // Shifted partial products

reg [3:0] q; // Quotient
reg [3:0] tr; // Temporary reminders
reg [3:0] ct = 0; // Counter

// Partial products
ands #(N) u1(b, q[ct], pp); // Creating partial products
assign pps = {pp, {N{1'b0}}} >> (N - ct); // Shifting partial products

// Interrupts
always @(posedge inp) begin
  tr <= a;
  ct <= N;
end

// Summing of partial products
always @(posedge clk) begin
  if (tr > 0) begin

    if(ct > 0) begin
      tr <= tr - pps;
      ct <= ct - 1;
    end
  else
    q[ct] <= 1;
  end
end
assign y = 0;

endmodule
