module shift_tb;

reg dir, clk, en;
reg [7:0] a;
wire [7:0] y;

shift #(8) uut (dir, clk, en, a, y);
reg [4:0] i;
always begin
  //setup
  $dumpfile("play.vcd");
  $dumpvars(0, shift_tb);

  clk = 1'b0; en = 1'b0;
  #5

  //testing
  $display("\nDefault case\n");
  dir = 1'b0; a = 8'b10101010; en = 1'b1;
  $display("%b%b%b %b", clk, dir, en, y);
  #4
  en = 1'b0;
  $display("\nSample output :\n");
  $display("%b%b%b %b", clk, dir, en, y);
  #4
  $display("%b%b%b %b", clk, dir, en, y);
  #4
  $display("%b%b%b %b", clk, dir, en, y);
  #4
  $display("%b%b%b %b", clk, dir, en, y);
  #4
  $display("\nSample output :\n");
  dir = 1'b1; a = 8'b11001101; en = 1'b1;
  $display("%b%b%b %b", clk, dir, en, y);
  #4
  en = 1'b0;
  $display("%b%b%b %b", clk, dir, en, y);
  #4
  $display("%b%b%b %b", clk, dir, en, y);
  #4
  $display("%b%b%b %b", clk, dir, en, y);
  #4
  $display("%b%b%b %b", clk, dir, en, y);
  #20
  $finish;
end
always begin
  clk = !clk;
  #2;
end
endmodule

