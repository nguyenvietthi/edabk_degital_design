module DongHoTheKy_main(clk, rst_n,a,b,c,d,e,f,g);
    input		clk;
	input		rst_n;
	output [13:0] a,b,c,d,e,f,g;
	wire [5:0]	sec;
	wire [5:0]	min;
	wire [4:0]	hour;
	wire [4:0]	day;
	wire [3:0]	mont;
	wire [12:0]	year;
	
	donghotheky donghotheky_inst(
        .clk (clk),
        .rst_n(rst_n),
        .sec (sec),
        .min (min),
        .hour (hour),
        .day (day),
        .mont (mont),
        .year (year)
    );
    
    display donghotheky_display(
        .sec (sec),
        .min (min),
        .hour (hour),
        .day (day),
        .mont (mont),
        .year (year),
        .a(a),
        .b(b),
        .c(c),
        .d(d),
        .e(e),
        .f(f),
        .g(g)
    );
endmodule