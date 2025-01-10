module mul_tb_top;
  parameter N = 4;
  logic clk;
  logic inp;
  logic [N - 1:0] a;
  logic [N - 1:0] b;
  logic [2 * N - 1:0] y;

  always #5 clk = ~clk;
  initial clk = 0;

  mul_tb #(N) tb (
      y,
      a,
      b,
      inp,
      clk
  );
  // array_mul #(N) uut (y, a, b, inp, clk);
  sign_mul #(N) u_s_mul (
      .product(y),
      .a(a),
      .b(b)
  );

endmodule


program mul_tb #(
    parameter N = 32
) (
    input logic [2 * N - 1:0] y,
    output logic [N - 1:0] a,
    output logic [N - 1:0] b,
    output logic inp,
    input logic clk
);
  int good, bad;
  initial begin
    $dumpfile("play.vcd");
    $dumpvars(0, mul_tb);
    for (int i = 0; i <= 10; i++) begin
      a = $urandom;
      b = $urandom;
      @(posedge clk);
      if ((a * b) == y) good++;
      else begin
        bad++;
        $display("Error :- for a = %0d, b = %0d = %0d != %0d", a, b, (a * b), y);
      end
    end
    $display("Number of good vs bad :- %0d / %0d", good, bad);
  end
endprogram
