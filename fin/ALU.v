module alu #(parameter N=32)(
  input en,
  input a[N:1],
  input b[N:1],
  input op[3:1],
  output y[2*N:1],
  output flag[3:1]
);

//TODO: Use flags

wire r_sum, r_diff, r_and, r_or, r_not, r_prod, r_lshift, r_rshift;
//internal operations
cla_add #(N) u_add(a, b, r_sum);
cla_add #(N) u_sub(a, -b, r_diff);
and u_and(r_and, a, b);
or u_not(r_or, a, b);
assign r_not = ~a;
shift #(N) u_shifter(1'b0,a,r_lshift);
shift #(N) u_shifter(1'b1,a,r_rshift);
mul #(N) u_mul(a, b, r_prod);

//output mux
always @ (en) begin
  case (op)
    3'b000 : y = r_sum;
    3'b001 : y = r_diff;
    3'b010 : y = r_and;
    3'b011 : y = r_or;
    3'b100 : y = r_not;
    3'b101 : y = r_lshift;
    3'b110 : y = r_rshift;
    3'b111 : y = r_prod;
    default : y = 0;
  endcase
end
endmodule

