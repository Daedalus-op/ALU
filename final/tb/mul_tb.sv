module top;
  parameter N = 32;
  logic clk;
  logic inp;
  logic [N/2 - 1:0] a;
  logic [N/2 - 1:0] b;
  logic [N - 1:0] y;

  always #5 clk = ~clk;

  mul_tb tb(y, a, b, inp, clk);
  array_mul #(N) uut (y, a, b, inp, clk);

endmodule


program mul_tb #(parameter N = 32)(
    input logic [N - 1:0] y,
    output logic [N/2 - 1:0] a,
    output logic [N/2 - 1:0] b,
    output logic inp,
    input logic clk
);
int good, bad;
  initial begin
    $dumpfile("play.vcd");
    $dumpvars(0, mul_tb);
    for(int i = 0; i <= 10; i++) begin
        inp = 1'b0; #1; inp = 1'b1;
        a = $urandom;
        b = $urandom;
        repeat(N) @(posedge clk);
        if((a * b) == y)
            good++;
        else begin
            bad++;
          $display("Error :- for a = %0d, b = %0d = %0d != %0d", a, b, (a+b), {ovf,s});
        end
    end
    $display("Number of good vs bad :- %0d / %0d",good, bad);
  end
endprogram

    a  = 4'd15;
    b  = 4'd14;
    en = 1'b0;
    #1;
    en = 1'b1;
    #(4 * N) $display("%b * %b = %d ,error = %b", a, b, p, (8'd210 - p));

    #4;
    $display("%b * %b = %d ,error = %b", a, b, p, (8'd210 - p));

    #4;
    $finish;
  end

  always begin
    clk = ~clk;
    #2;
  end
endmodule
