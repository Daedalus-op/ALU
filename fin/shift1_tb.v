
module shift_tb;

reg dir, clk;
reg [7:0] a;
wire [7:0] y;

shift1 #(8) uut (dir, a, y);
initial begin
  //setup
  $dumpfile("play.vcd");
  $dumpvars(0, shift_tb);
  //testing
  $display("\nDefault case\n");
  dir = 1'b0; a = 8'b10101010;
  $display("%b %b", dir, y);
  #4
  $display("\nSample output :\n");
  $display("%b %b", dir, y);
  dir = 1'b0; a = 8'b00110011; #4
  $display("%b %b", dir, y);
  #4
  dir = 1'b1; a = 8'b00110011; #4
  $display("%b %b", dir, y);
  #10
  $finish;
end
endmodule
