// Clocked serial shifters
module shift #(parameter N = 4)(
  output logic [N - 1:0] y,
  input logic dir,
  input logic clk,
  input logic inp,
  input logic al,
  input logic [N - 1:0] a
);
logic [N - 1:0] cache; // Cache to store intermediate values
shift1 #(N) u_sh(y, dir, cache, a);

// Interupt to enter new inputs
always @(inp) begin
  cache <= a;
end

// Shifting wrt clk
always @(posedge clk) begin
  if (inp == 0) begin
    cache <= y;
  end
end

endmodule

// Single shifters
module shift1 #(parameter N = 4) (
  output logic [N - 1:0] y,
  input logic dir,
  input logic al, // logical or arithmetic
  input logic [N - 1:0] a
);

logic [N - 1:0] i;

always_comb begin
  // Right shift
  if (dir == 1'b1) begin
    for (i = 0; i < N - 1; i = i + 1) begin
      y[i] = a[i + 1];
    end

    if(al == 0)
      y[N - 1] = 1'b0;
    else
      y[N - 1] = 1'b1;
  end

  // Left Shift
  else if (dir == 1'b0) begin
    for (i = N - 1; i > 0; i = i - 1) begin
      y[i] = a[i - 1];
    end
    y[0] = 1'b0;
  end
end

endmodule