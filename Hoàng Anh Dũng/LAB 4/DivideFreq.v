`timescale 1ns / 1ps
module DivideFreq(
    input       [0:0]   clk50M,
    input       [0:0]   Reset,
    output reg  [0:0]   clk,
    output reg  [0:0]   rst
    );
    reg         [25:0]  count;

    always@(negedge Reset) begin
	    if(!Reset) begin rst = 0; end
	    else begin rst = 1; end
    end

    always@(posedge clk50M or negedge Reset) begin
	    if(!Reset) begin 
	        clk     <= 0; 
	        count   <= 0; 
	    end
	    else if(count == 24999999) begin
		    clk     <= !clk;
		    count   <= 0;
        end
	    else begin
	        clk      <= clk;
	        count    <= count + 1 ;
	   end
    end
endmodule