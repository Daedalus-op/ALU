module shift #(parameter N=4)(
  input dir,
  input clk,
  input en,
  input [N - 1:0] a,
  output reg [N - 1:0] y
);
reg [N-1:0] i;
always @(en) begin
  if (en == 1'b1) begin
    y <= a;
  end
end

always @(posedge clk) begin
  if (en == 1'b0) begin
    // Right Shift
    if ((dir == 1) & (clk == 1)) begin
      for (i = 0; i < N - 1; i = i + 1) begin
        y[i] <= y[i + 1];
      end
      y[N - 1] <= 1'b0;
    end
    // Left Shift
    else if ((dir == 0) & (clk == 1)) begin
      for (i = N - 1; i > 0; i = i - 1) begin
        y[i] <= y[i - 1];
      end
      y[1] <= 1'b0;
    end
  end
end

endmodule
