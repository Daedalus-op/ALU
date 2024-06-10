module tb_mul;

reg [1:0] a,b;
reg clk, en;
wire [3:0] p;

ser_mul #(2) uut(clk, en, a, b, p);

initial begin
  #5;
  a = 2'b11; b = 2'b11; en = 1'b1;
  #4; en = 1'b0;
  #4;
  $display("%b * %b = %b", a, b, p);
  #4;
  $display("%b * %b = %b", a, b, p);
  #4;
  $display("%b * %b = %b", a, b, p);
  #4;
  $display("%b * %b = %b", a, b, p);
  #50;
  $finish;
end

always begin
  clk = !clk;
  #2;
end
endmodule
