module alu #(parameter N = 32)(
  input inp, // Interupt for Multiplier
  input clk,
  input [2:0] op, // Opcode
  input [N - 1:0] a,
  input [N - 1:0] b,
  output reg [N - 1:0] y_ext,
  output reg [N - 1:0] y,
  output reg flg // Flag
);
wire bor, ovf;

// TODO: Use flags
// TODO: Complete the structure and test it out

wire [N - 1:0] r_sum, r_diff, r_and, r_or, r_not, r_lshift, r_rshift;
wire [2 * N - 1:0] r_prod;

//Internal operations
// Add & Sub
rca_add #(N) u_add(a, b, r_sum, ovf);
rca_add #(N) u_sub(a, -b, r_diff, bor);

// Logic
ands #(N) u_and(a, b, r_and);
ors #(N) u_or(a, b, r_or);
nots #(N)  u_not(a, r_not);

// Shifters
shift #(N) u_lshifter(1'b0, clk, inp, a, r_lshift); // Left shift
shift #(N) u_rshifter(1'b1, clk, inp, a, r_rshift); // Right shift

// Multiplier
array_mul #(N) u_mul(clk, inp, a, b, r_prod);

//output mux
always @ (*) begin
  case (op)
    3'b000 : begin y_ext <= {N{1'b0}}; y <= r_sum; flg <= ovf ; end
    3'b001 : begin y_ext <= {N{1'b0}}; y <= r_diff; flg <= bor; end
    3'b010 : begin y_ext <= {N{1'b0}}; y <= r_and; end
    3'b011 : begin y_ext <= {N{1'b0}}; y <= r_or; end
    3'b100 : begin y_ext <= {N{1'b0}}; y <= r_not; end
    3'b101 : begin y_ext <= {N{1'b0}}; y <= r_lshift; end
    3'b110 : begin y_ext <= {N{1'b0}}; y <= r_rshift; end
    3'b111 : {y_ext,y} <= r_prod;
    default : y <= 0;
  endcase
end
endmodule

