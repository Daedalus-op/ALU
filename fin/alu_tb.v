module alu_tb;
parameter N = 4;
parameter T = 4;

reg clk, inp;
reg [2:0] opcode;
reg [N - 1:0] a;
reg [N - 1:0] b;
wire ovf;
wire [N - 1:0] y;
wire [N - 1:0] y_ext;

alu #(N) u_alu(inp, clk, opcode, a, b, y_ext, y, ovf); 

initial begin
  $dumpfile("play.vcd");
  $dumpvars(0, alu_tb);

  clk = 0;
  #1;

  a = 'd5; b = 'd13; // Can be changed to any value

  $display("\n----Arithmetic----\n");
  opcode = 3'b000; inp = 1'b0; #1 inp = 1'b1; #1; inp = 1'b0;
  #(T * N)
  $display("%b + %b = %b_%b (%d)", a, b, ovf, y, {ovf, y}); // add
  $display("[ %d + %d = %d ]\n", a, b, {ovf, y}); // add

  opcode = 3'b001; inp = 1'b0; #1 inp = 1'b1; #1; inp = 1'b0;
  #(T * N)
  $display("%b - %b = %b_%b (%d)", a, b, ovf, y, $signed(y)); // sub
  $display("[ %d - %d = %d ]\n", a, b, $signed(y)); // sub


  $display("----Logic----\n");
  opcode = 3'b010; inp = 1'b0; #1 inp = 1'b1; #1; inp = 1'b0;
  #(T * N)
  $display("%b & %b = %b (%d)", a, b, y, y); // and

  opcode = 3'b011; inp = 1'b0; #1 inp = 1'b1; #1; inp = 1'b0;
  #(T * N)
  $display("%b | %b = %b (%d)", a, b, y, y); // or

  opcode = 3'b100; inp = 1'b0; #1 inp = 1'b1; #1; inp = 1'b0;
  #(T * N)
  $display("~ %b = %b (%d)\n", a, y, y); // not


  $display("----Shift----\n");
  opcode = 3'b101; inp = 1'b0; #1 inp = 1'b1; #1; inp = 1'b0;
  #(T / 2)
  $display("%b << 1 = %b (%d)", a, y, y); // left shift
  #(T)
  $display("%b << 2 = %b (%d)", a, y, y); // left shift
  #(T)
  $display("%b << 3 = %b (%d)", a, y, y); // left shift
  #(T)
  $display("%b << 4 = %b (%d)\n", a, y, y); // left shift

  opcode = 3'b110; inp = 1'b0; #1 inp = 1'b1; #1; inp = 1'b0;
  #(T / 2)
  $display("%b >> 1 = %b (%d)", a, y, y); // right shift
  #(T)
  $display("%b >> 2 = %b (%d)", a, y, y); // right shift
  #(T)
  $display("%b >> 3 = %b (%d)", a, y, y); // right shift
  #(T)
  $display("%b >> 4 = %b (%d)\n", a, y, y); // right shift


  $display("----Multiply----\n");
  opcode = 3'b111; inp = 1'b0; #1 inp = 1'b1; #1; inp = 1'b0;
  #(T * N)
  $display("%b * %b = %b_%b (%d)", a, b, y_ext, y, {y_ext, y}); // multiply
  $display("[ %d * %d = (%d) ]\n", a, b, {y_ext, y}); // multiply

  #4;
  $finish;
end

always begin
  clk = ~clk;
  #(T / 2);
end

endmodule
