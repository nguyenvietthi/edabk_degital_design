module Display(
	input   [6:0]   hw_time,
    input   [6:0]   ct_time,
	output	[3:0]	a,b,c,d,e,f,g
	);
	
	wire    [3:0]  hw_0, hw_1, ct_0, ct_1;
	assign hw_0=hw_time%10;
	assign hw_1=hw_time/10;
	assign ct_0=ct_time%10;
	assign ct_1=ct_time/10;
	
	giaima7thanh m_0    (.x(hw_0),.a(a[0]),.b(b[0]),.c(c[0]),.d(d[0]),.e(e[0]),.f(f[0]),.g(g[0]));
    giaima7thanh m_1    (.x(hw_1),.a(a[1]),.b(b[1]),.c(c[1]),.d(d[1]),.e(e[1]),.f(f[1]),.g(g[1]));
    giaima7thanh m_2    (.x(ct_0),.a(a[2]),.b(b[2]),.c(c[2]),.d(d[2]),.e(e[2]),.f(f[2]),.g(g[2]));
    giaima7thanh m_3    (.x(ct_1),.a(a[3]),.b(b[3]),.c(c[3]),.d(d[3]),.e(e[3]),.f(f[3]),.g(g[3]));
endmodule