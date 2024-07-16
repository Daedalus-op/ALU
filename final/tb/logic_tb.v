`include "logic.v"

module logic_tb;

  reg  [7:0] a;
  reg  [7:0] b;
  wire [7:0] y_and;
  wire [7:0] y_or;
  wire [7:0] y_not;

  ands #(8) u_and (
      a,
      b,
      y_and
  );
  ors #(8) u_or (
      a,
      b,
      y_or
  );
  nots #(8) u_not (
      a,
      y_not
  );
  always begin
    a = 8'b01010101;
    b = 8'b00110011;
    #2 $display(" %b &\n %b \n %b", a, b, y_and);
    $display(" %b |\n %b \n %b", a, b, y_or);
    $display("~\n %b \n %b", a, y_not);
    #2;
    $finish;
  end
endmodule
