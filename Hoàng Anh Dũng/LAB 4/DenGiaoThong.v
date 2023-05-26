module DenGiaoThong(
	input 			clk50M,
	input 			Reset,
	input	[0:0] 	car,
	output	[3:0] 	a,b,c,d,e,f,g
	);
	wire            clk;
    wire            rst;
    wire    [1:0]   state_now;
    wire    [0:0]   timeout_state1;
    wire    [0:0]   timeout_state2;
    wire    [0:0]   timeout_state3;
    wire    [1:0]   hw_color;
    wire    [1:0]   ct_color;
    wire    [6:0]   hw_time;
    wire    [6:0]   ct_time;
	
	DivideFreq dividefreq_inst(
		.clk50M(clk50M),
		.Reset(Reset),
		.clk(clk), 
		.rst(rst)
	);
	
	Timer timer_inst (
		.clk (clk),
		.rst (rst),
		.car (car),
		.state_now (state_now),
		.hw_time (hw_time),
		.ct_time (ct_time),
		.timeout_state1 (timeout_state1),
		.timeout_state2 (timeout_state2),
		.timeout_state3 (timeout_state3)
	);
	
	State state_inst (
		.clk (clk),
		.rst (rst),
		.car (car),
		.timeout_state1 (timeout_state1),
		.timeout_state2 (timeout_state2),
		.timeout_state3 (timeout_state3),
		.hw_color (hw_color),
		.ct_color (ct_color)
	);
	
	Display display_inst(
		.hw_time (hw_time),
		.ct_time (ct_time),
		.a(a),
        .b(b),
        .c(c),
        .d(d),
        .e(e),
        .f(f),
        .g(g)
	);
endmodule