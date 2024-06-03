module shift_tb;

reg dir, clk, rst;
reg [3:0] a;
wire [3:0] y;

shifter #(4) uut (dir, clk, rst, a, y);
always begin
  //setup
  clk = 1'b0; rst = 1'b1;
  $display("%b", a);
  #5

  //testing
  dir = 1'b0; a = 4'b0101; rst = 1'b0;
  $display("%b%b%b %b", clk, dir, rst, y);
  #4
  $display("%b%b%b %b", clk, dir, rst, y);
  #4
  dir = 1'b1; a = 4'b0101; rst = 1'b0;
  $display("%b%b%b %b", clk, dir, rst, y);
  #4
  dir = 1'b0; a = 4'b0101; rst = 1'b0;
  $display("%b%b%b %b", clk, dir, rst, y);
  #4
  dir = 1'b0; a = 4'b0101; rst = 1'b0;
  $display("%b%b%b %b", clk, dir, rst, y);
  #20
  $finish;
end
always begin
  clk = !clk;
  #2;
end
endmodule

