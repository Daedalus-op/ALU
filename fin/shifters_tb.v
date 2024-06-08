module shift_tb;

reg dir, clk, rst;
reg [7:0] a;
wire [7:0] y;

shifter #(8) uut (dir, clk, rst, a, y);
always begin
  //setup
  $dumpfile("play.vcd");
  $dumpvars(0, shift_tb);

  clk = 1'b0; rst = 1'b1;
  #5

  //testing
  dir = 1'b0; a = 8'b10101010; rst = 1'b0;
  $display("%b%b%b %b", clk, dir, rst, y);
  #4
  $display("%b%b%b %b", clk, dir, rst, y);
  #4
  $display("%b%b%b %b", clk, dir, rst, y);
  #4
  $display("%b%b%b %b", clk, dir, rst, y);
  #4
  rst = 1'b1;
  #4
  dir = 1'b1; a = 8'b11001101; rst = 1'b0;
  $display("%b%b%b %b", clk, dir, rst, y);
  #4
  $display("%b%b%b %b", clk, dir, rst, y);
  #4
  $display("%b%b%b %b", clk, dir, rst, y);
  #4
  $display("%b%b%b %b", clk, dir, rst, y);
  #20
  $finish;
end
always begin
  clk = !clk;
  #2;
end
endmodule

