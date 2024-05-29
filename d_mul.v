module ha(a,b,s,c);
input a,b;
output s,c;

xor n1(s,a,b);
and n2(c,a,b);

endmodule

module mul(a,b,prod);
input [1:0] a;   
input [1:0] b;  
output [3:0] prod;

wire w1, w2, w3, c;

and u0(prod[0], a[0], b[0]);

and u1(w1, a[0], b[1]);
and u2(w2, a[1], b[0]);

ha add_r1 (w1, w2, prod[1], c);

and u3(w3, a[1], a[1]);
ha add_r2(w3, c, prod[2], prod[3]);

endmodule
