module shifter #(parameter N=32)(
  input direction,
  input [N:1] a,
  output [N:1] y
);
always_comb begin
  case (direction)
    1'b0 : y = {a[N - 1:1], 1'b0}; // left shift
    1'b0 : y = {1'b0, a[N:2]}; // right shift
    default: y = a;
  endcase
end
endmodule
