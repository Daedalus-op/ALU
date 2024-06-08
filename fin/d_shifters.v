module shifter #(parameter N=4)(
  input dir,
  input clk,
  input rst,
  input [N - 1:0] a,
  output reg [N - 1:0] y
);
reg [N-1:0] i;
reg en;
always @(posedge clk , rst) begin
  if (rst == 1'b1) begin
      y <= 'd0;
      en <= 1'b0;
    end
  else begin
    if (en == 1'b0) begin
      y <= a;
      en <= 1'b1;
    end
    else begin
      // Right Shifti
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
end

endmodule
