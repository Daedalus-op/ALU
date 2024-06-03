module shifter #(parameter N=32)(
  input dir,
  input clk,
  input rst,
  input [N:1] a,
  output reg [N:1] y
);
reg [N-1:0] i;
always @(posedge clk , rst)
  begin
    if (rst == 1)
      begin
        y <= 'd0;
      end
    else if (rst != 1)
      begin
        y <= a;
      end

    // Right Shift
    if ((dir == 1) & (clk == 1))
      begin
        for(i = 1; i < N; i = i + 1) begin
          y[i] <= y[i + 1];
        end
        y[N] <= 1'b0;
      end
    // Left Shift
    else if ((dir == 0) & (clk == 1))
      begin
        for(i = N; i > 1; i = i - 1) begin
          y[i] <= y[i - 1];
        end
        y[1] <= 1'b0;
      end
  end

endmodule
