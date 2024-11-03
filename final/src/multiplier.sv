module serial_mult#(parameter width = 32)(
	output logic [31:0] upper, lower,
	input logic [31:0] a, b
	);
	logic button;
	logic [63:0] shifted_partial, partial;
	assign shifted_partial = {{32{1'b0}},b};
	always@(posedge button) begin
		if (a[0]) partial = shifted_partial + b;
		shifted_partial = partial << 1;
	end
endmodule

module mult #(parameter width = 32)(
	output logic [31:0] upper, lower,
	input logic [31:0] a, b
	);
	always begin

	end
endmodule
