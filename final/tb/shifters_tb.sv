module shift_tb;

  logic dir, clk, inp;
  logic  [7:0] a;
  logic [7:0] y;

  shift #(8) uut ( dir, clk, inp, a, y);
  logic [4:0] i;
  initial begin
    //setup
    $dumpfile("play.vcd");
    $dumpvars(0, shift_tb);
    clk = 0;
    //testing
    $display("\nDefault case\n");
    dir = 1'b0;
    a   = 8'b10101010;
    inp = 1'b1;
    #1 $display("%b%b %b", clk, dir, y);
    #4 inp = 1'b0;
    $display("\nSample output :\n");
    $display("%b%b %b", clk, dir, y);
    #4 $display("%b%b %b", clk, dir, y);
    #4 $display("%b%b %b", clk, dir, y);
    #4 $display("%b%b %b", clk, dir, y);
    #4 $display("\nSample output :\n");
    dir = 1'b1;
    a   = 8'b11001101;
    inp = 1'b1;
    #1 $display("%b%b %b", clk, dir, y);
    #4 inp = 1'b0;
    $display("%b%b %b", clk, dir, y);
    #4 $display("%b%b %b", clk, dir, y);
    #4 $display("%b%b %b", clk, dir, y);
    #4 $display("%b%b %b", clk, dir, y);
    #20 $finish;
  end
  initial
    forever begin
      clk = !clk;
      #2;
    end
endmodule
