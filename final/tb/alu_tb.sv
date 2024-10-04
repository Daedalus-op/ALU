// hopefull
module top;
  parameter N=5;
  logic clk;
  logic [3:0] opcode;
  logic [N - 1:0] a;
  logic [N - 1:0] b;
  logic ovf;
  logic [N - 1:0] y;
  logic flg;

  initial clk = 0;
  always #1 clk = !clk;
  alu #(N) dut(y, flg, clk, opcode, a, b);
  alu_tb #(N) tb( y, clk, opcode, a, b, ovf);
endmodule


program alu_tb #(parameter N=5)(
  input logic [N - 1:0] y,
  input logic clk,
  output logic [3:0] opcode,
  output logic [N - 1:0] a,
  output logic [N - 1:0] b,
  input logic ovf
);
  parameter NT = 10;

  int good = 0, bad = 0;

  initial begin
    $dumpfile("play.vcd");
    $dumpvars(0, alu_tb);


    a = $random;
    b = $random; 

    $display("\n----Arithmetic----\n");
    $display("\n----ADD\n");
    opcode = 4'b0000;
    for(int i = 0; i < NT; i++) begin
      @(posedge clk);
      if({y} == (a+b))
        good++;
      else begin
        bad++;
        $display("%b + %b != %b_%b (%d)", a, b, ovf, y, {ovf, y});  // add
        $display("[ %d + %d = %d ]\n", a, b, {ovf, y});  // add
      end
    end
    $display("Good vs Bad : %0d / %0d\n",good, bad);

    $display("\n----SUB\n");
    opcode = 4'b0001;
        good = 0; bad = 0;
    for(int i = 0; i < NT; i++) begin
      @(posedge clk);
      if({y} == (a-b))
        good++;
      else begin
        bad++;
        $display("%b - %b != %b_%b (%d)", a, b, ovf, y, {ovf, y});  // add
        $display("[ %d - %d = %d ]\n", a, b, {ovf, y});  // add
      end
    end
    $display("Good vs Bad : %0d / %0d\n",good, bad);

    $display("----Logic----\n");
    $display("\n----AND\n");
    opcode = 4'b0010;
    good = 0; bad = 0;
    for(int i = 0; i < NT; i++) begin
      @(posedge clk);
      if(y == (a & b))
        good++;
      else begin
        bad++;
        $display("%b and \n%b != \n%b", a, b, y);  // add
      end
    end
    $display("Good vs Bad : %0d / %0d\n",good, bad);

    $display("\n----OR\n");
    opcode = 4'b0011;
        good = 0; bad = 0;
    for(int i = 0; i < NT; i++) begin
      @(posedge clk);
      if(y == (a | b))
        good++;
      else begin
        bad++;
        $display("%b or \n%b != \n%b", a, b, y);  // add
      end
    end
    $display("Good vs Bad : %0d / %0d\n",good, bad);

    $display("\n----XOR\n");
    opcode = 4'b0100;
        good = 0; bad = 0;
    for(int i = 0; i < NT; i++) begin
      @(posedge clk);
      if(y == (a ^ b))
        good++;
      else begin
        bad++;
        $display("%b xor \n%b != \n%b", a, b, y);  // add
      end
    end
    $display("Good vs Bad : %0d / %0d\n",good, bad);


    $display("----Shift----\n");
    $display("----Left\n");
    opcode = 4'b0101;
        good = 0; bad = 0;
    for(int i = 0; i < NT; i++) begin
      @(posedge clk);
      if(y == (a << b))
        good++;
      else begin
        bad++;
        $display("%b << \n%b != \n%b", a, b, y);  // add
      end
    end
    $display("Good vs Bad : %0d / %0d\n",good, bad);

    $display("----Right\n");
    opcode = 4'b0110;
        good = 0; bad = 0;
    for(int i = 0; i < NT; i++) begin
      @(posedge clk);
      if(y == (a >> b))
        good++;
      else begin
        bad++;
        $display("%b >> \n%b != \n%b", a, b, y);  // add
      end
    end
    $display("Good vs Bad : %0d / %0d\n",good, bad);

    $display("----Arithmetic right\n");
    opcode = 4'b0111;
        good = 0; bad = 0;
    for(int i = 0; i < NT; i++) begin
      @(posedge clk);
      if(y == (a >>> b))
        good++;
      else begin
        bad++;
        $display("%b >>> \n%b != \n%b", a, b, y);  // add
      end
    end
    $display("Good vs Bad : %0d / %0d\n",good, bad);

    $display("----Multiply----\n");
    $display("Not implemented"); 

  end
endprogram
