module tb_mul;

reg [1:0] a,b;
wire [3:0] p;

multiplier uut(a, b, p);

initial begin
  #5;
  a = 2'b00; b = 2'b00;
  $display("%b * %b = %b", a, b, p);
  #5;
  a = 2'b01; b = 2'b00;
  $display("%b * %b = %b", a, b, p);
  #5;
  a = 2'b00; b = 2'b11;
  $display("%b * %b = %b", a, b, p);
  #5;
  a = 2'b11; b = 2'b11;
  $display("%b * %b = %b", a, b, p);
  #5;
end
endmodule
