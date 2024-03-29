module add_tb;
  parameter N = 4;  
  reg [N-1:0] a,b;
  wire [2*N-1:0] s;
  wire ovf;
  assign avf = 1'b0;
  multiplier uut(a,b,s);

  initial begin
    $dumpfile("play.vcd");
    $dumpvars(0,add_tb);

    a = 4'd0; b = 4'd0; #10; 
    $display("%d + %d = %d , %b",a,b,s,ovf);
    a = 4'd3; b = 4'd6; #10;
    $display("%d + %d = %d , %b",a,b,s,ovf);
    a = 4'd9; b = 4'd9; #10;
    $display("%d + %d = %d , %b",a,b,s,ovf);
    a = 4'd5; b = -4'd1; #10;
    $display("%d + %d = %d , %b",a,b,s,ovf);
    a = -4'd5; b = 4'd1; #10;
    $display("%d + %d = %d , %b",a,b,s,ovf);

    #10;
    $finish();

  end
endmodule
