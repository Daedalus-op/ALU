// Clocked serial shifters
module shift #(parameter N = 4)(
  input dir,
  input clk,
  input inp,
  input [N - 1:0] a,
  output [N - 1:0] y
);
reg [N - 1:0] cache; // Cache to store intermediate values
shift1 #(N) u_sh(dir, cache, y);

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
  input dir,
  input [N - 1:0] a,
  output reg [N - 1:0] y
);

reg [N - 1:0] i;

always @(*) begin
  // Right shift
  if (dir == 1'b1) begin
    for (i = 0; i < N - 1; i = i + 1) begin
      y[i] = a[i + 1];
    end
    y[N - 1] = 1'b0;
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
