`timescale 1ns/1ps
module testbench();
    reg             clk=0;
    reg             rst;
    wire    [1:0]   state_now;
    reg     [0:0]   car=0;
    wire    [0:0]   timeout_state1;
    wire    [0:0]   timeout_state2;
    wire    [0:0]   timeout_state3;
    wire    [1:0]   hw_color;
    wire    [1:0]   ct_color;
    wire    [6:0]   hw_time;
    wire    [6:0]   ct_time;
    
    always #0.5 clk = ~clk;
    
	Timer timer_tb (
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
	
	State state_tb (
		.clk (clk),
		.rst (rst),
		.car (car),
		.timeout_state1 (timeout_state1),
		.timeout_state2 (timeout_state2),
		.timeout_state3 (timeout_state3),
		.hw_color (hw_color),
		.ct_color (ct_color),
		.state_now (state_now)
	);
	
	initial begin 
        rst = 0;
        #1;
        rst = 1;
        
		
		repeat(30) @(negedge clk);
		car = 1;
		@(negedge clk);
		car = 0;
		
		#1000000;
        $finish;
    end
	
endmodule
