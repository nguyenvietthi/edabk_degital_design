module giaima7thanh(x,a,b,c,d,e,f,g);
	input [3:0] x;
	output reg a,b,c,d,e,f,g;
	always@(x) begin
	    case (x)
		    4'b0000: begin a=1; b=1; c=1; d=1; e=1; f=1; g=0; end 	//0
		    4'b0001: begin a=0; b=1; c=1; d=0; e=0; f=0; g=0; end 	//1
		    4'b0010: begin a=1; b=1; c=0; d=1; e=1; f=0; g=1; end 	//2
		    4'b0011: begin a=1; b=1; c=1; d=1; e=0; f=0; g=1; end 	//3
		    4'b0100: begin a=0; b=1; c=1; d=0; e=0; f=1; g=1; end	//4
		    4'b0101: begin a=1; b=0; c=1; d=1; e=0; f=1; g=1; end	//5
		    4'b0110: begin a=1; b=0; c=1; d=1; e=1; f=1; g=1; end	//6
		    4'b0111: begin a=1; b=1; c=1; d=0; e=0; f=0; g=0; end	//7
		    4'b1000: begin a=1; b=1; c=1; d=1; e=1; f=1; g=1; end	//8
		    4'b1001: begin a=1; b=1; c=1; d=1; e=0; f=1; g=1; end	//9
		    default: begin a=0; b=0; c=0; d=0; e=0; f=0; g=1; end 	//-
	    endcase
	  end
endmodule

module giaima7thanh_main(x0,x1,x2,x3,a,b,c,d,e,f,g);
	input wire [3:0] x0,x1,x2,x3;
	output wire [3:0] a,b,c,d,e,f,g;
    giaima7thanh m0(.x(x0),.a(a[0]),.b(b[0]),.c(c[0]),.d(d[0]),.e(e[0]),.f(f[0]),.g(g[0]));
	giaima7thanh m1(.x(x1),.a(a[1]),.b(b[1]),.c(c[1]),.d(d[1]),.e(e[1]),.f(f[1]),.g(g[1]));
	giaima7thanh m2(.x(x2),.a(a[2]),.b(b[2]),.c(c[2]),.d(d[2]),.e(e[2]),.f(f[2]),.g(g[2]));
	giaima7thanh m3(.x(x3),.a(a[3]),.b(b[3]),.c(c[3]),.d(d[3]),.e(e[3]),.f(f[3]),.g(g[3]));
endmodule