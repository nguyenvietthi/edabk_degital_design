`timescale 1ns/1ps
module tb ();
    reg        clk=0;
    reg        rst_n;
    wire [5:0] sec;
    wire [5:0] min;
    wire [4:0] hour;
    wire [4:0] day;
    wire [3:0] mont;
    wire [12:0] year;

    always #0.5 clk = ~clk;

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

    initial begin 
        rst_n = 0;
        #1;
        rst_n = 1;
        #1000000;
        $finish;
    end
endmodule
