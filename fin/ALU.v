module alu #(parameter N=32)(
  input en,
  input a[N:1],
  input b[N:1],
  input op[3:1],
  input clk,
  output y[2*N:1],
  output flag[3:1]
);

// TODO: Use flags
// TODO: Complete the structure and test it out

reg inp; // Interupt for Multiplier
wire r_sum, r_diff, r_and, r_or, r_not, r_prod, r_lshift, r_rshift;

//Internal operations
// Add & Sub
cla_add #(N) u_add(a, b, r_sum);
cla_add #(N) u_sub(a, -b, r_diff);

// Logic
ands #(N) u_and(r_and, a, b);
ors #(N) u_or(a, b, r_or);
nots #(N)  u_not(a, r_not);

// Shifters
shift #(N) u_lshifter(1'b0, clk, inp, a, r_lshift); // Left shift
shift #(N) u_rshifter(1'b1, clk, inp, a, r_rshift); // Right shift

// Multiplier
array_mul #(N) u_mul(clk, a, b, r_prod);

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

