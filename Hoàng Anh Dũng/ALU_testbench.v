`timescale 1ns/1ps
module Cong(x,y,z);
    input [31:0] x,y;
    output [31:0] z;
    assign z=x+y;
endmodule
/****************************************************************/
module Tru(x,y,z);
    input [31:0] x,y;
    output [31:0] z;
    assign z=x-y;
endmodule
/****************************************************************/
module NOT(x,z);
    input [31:0] x;
    output [31:0] z;
    genvar i;
    generate
    for (i=0;i<32;i=i+1) begin
        assign z[i]=!x[i];
    end
    endgenerate
endmodule
/****************************************************************/
module AND(x,y,z);
    input [31:0] x,y;
    output [31:0] z;
    genvar i;
    generate
    for (i=0;i<32;i=i+1) begin
        assign z[i]=x[i]&&y[i];
    end
    endgenerate 
endmodule
/****************************************************************/
module OR(x,y,z);
    input [31:0] x,y;
    output [31:0] z;
    genvar i;
    generate
    for (i=0;i<32;i=i+1) begin
        assign z[i]=x[i]||y[i];
    end
    endgenerate 
endmodule
/****************************************************************/
module XOR(x,y,z);
    input [31:0] x,y;
    output [31:0] z;
    genvar i;
    generate
    for (i=0;i<32;i=i+1) begin
        assign z[i]=x[i]^y[i];
    end
    endgenerate 
endmodule
/****************************************************************/
module ShiftLeft(x,y,z);
    input [31:0] x,y;
    output [31:0] z;
    assign z=x<<y;
endmodule
/****************************************************************/
module ShiftRight(x,y,z);
    input [31:0] x,y;
    output [31:0] z;
    assign z=x>>y;
endmodule
/****************************************************************/
module Majority(x,z);
    input [31:0] x;
    output z;
    integer count=0;
    reg t;

    genvar i;
    generate
    for (i=0;i<32;i=i+1) begin
        always@(i) begin
            if (x[i]==1) count=count+1;
        end
    end
    endgenerate
    
    initial begin
        #1;
        if (count>16) t=1;
            else t=0;
    end
    assign z=t;
endmodule
/****************************************************************/
module cong_CRA(x,y,z);
    input [7:0] x,y;
    output [8:0] z;
    integer m=0;                    
    
    genvar i;
    generate
    for (i=0;i<8;i=i+1) begin
        always@(i or m) begin
            #1;
            if ((x[i]==1)&&(y[i]==0)&&(m==1)) m=1;     
            else if ((x[i]==0)&&(y[i]==1)&&(m==1)) m=1;     //          1
            else if ((x[i]==1)&&(y[i]==1)&&(m==0)) m=1;     //      +   1
            else if ((x[i]==1)&&(y[i]==1)&&(m==1)) m=1;     //      +   0  
            else m=0;                                       //      = 1 0
        end
        assign z[i]=x[i]+y[i]+m;
    end
    endgenerate
endmodule
/****************************************************************/
module ALU_testbench();
    reg [31:0] test_x, test_y;
    wire [31:0] test_z;
    reg [31:0] golden_out;
    
    Cong duv(.x(test_x),.y(test_y),.z(test_z));
    //Tru duv(.x(test_x),.y(test_y),.z(test_z));
    
    initial begin
        repeat(10) begin
			test_x = $random;
			test_y = $random;
			#1;
		end
    end
    
    always@ (test_x or test_y) begin
        golden_out = test_x+test_y;
        //golden_out = test_x-test_y;
    end
    
    initial begin
        $monitor ("%t:golden_out=%b \n test_z=%b\n",$time,golden_out,test_z);
    end
endmodule 