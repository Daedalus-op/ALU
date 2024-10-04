module top;
  parameter N = 32;
  logic [7:0] a;
  logic [7:0] b;
  logic [7:0] y_and;
  logic [7:0] y_or;
  logic [7:0] y_not;

  logic_tb tb(a, b, y_and, y_or, y_not);


  ands #(8) u_and ( a, b, y_and);
  ors #(8) u_or ( a, b, y_or);
  nots #(8) u_not ( a, y_not);

endmodule

program logic_tb(
  output logic [7:0] a,
  output logic [7:0] b,
  input logic [7:0] y_and,
  input logic [7:0] y_or,
  input logic [7:0] y_not
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
endprogram
