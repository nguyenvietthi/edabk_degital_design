module donghotheky(clk, rst_n, sec, min, hour, day, mont, year);
	input				clk;
	input				rst_n;
	output reg [5:0]	sec;
	output reg [5:0]	min;
	output reg [4:0]	hour;
	output reg [4:0]	day;
	output reg [3:0]	mont;
	output reg [12:0]	year;
	
	//Khong duoc phep co initial
	
    always @(posedge clk or negedge rst_n) begin
        if(~rst_n) sec <= 0;
        else begin
            if(sec == 59) sec <= 0;
            else sec <= sec + 1;
        end
    end
    
     always @(posedge clk or negedge rst_n) begin
        if(~rst_n) min <= 0;
        else begin
            if (sec==59 && min==59) min<=0;
            else if (sec==59 && min!=59) min<=min+1;
            else min<=min;
        end
     end
     
     always @(posedge clk or negedge rst_n) begin
        if (~rst_n) hour <= 0;
        else begin
            if (sec==59 && min==59 && hour==23) hour<=0;
            else if (sec==59 && min ==59 && hour!=23) hour<=hour+1;
            else hour<=hour;
        end
     end
     
     always @(posedge clk or negedge rst_n) begin
        if (~rst_n) day <=1;
        else begin
            if (sec==59 && min==59 && hour==23) begin
                if ( day==31 && (mont==1||mont==3||mont==5||mont==7||mont==8||mont==10||mont==12) ) day<=1;
                else if ( day==30 && (mont==4||mont==6||mont==9||mont==11) ) day<=1;
                else if ( day==28 && mont==2 && (year%4!=0 || year==2100) ) day<=1;
                else if ( day==29 && mont==2 && year%4==0 && year!=2100 ) day<=1;
                else day<=day+1;
            end
            else day<=day;
        end
     end
     
    always @(posedge clk or negedge rst_n) begin
        if (~rst_n) mont <=1;
        else begin
            if (sec==59 && min==59 && hour==23) begin
                if (day==31 && mont==12) mont<=1;
                else if ( day==31 && (mont==1||mont==3||mont==5||mont==7||mont==8||mont==10) ) mont<=mont+1;
                else if ( day==28 && mont==2 && (year%4!=0 || year==2100) ) mont<=mont+1;
                else if ( day==29 && mont==2 && year%4==0 && year!=2100 ) mont<=mont+1;
                else mont<=mont;
            end
            else mont<=mont;
        end
    end
    
    always @(posedge clk or negedge rst_n) begin
        if (~rst_n) year <=2001;
        else if (sec==59 && min==59 && hour==23 && day==31 && mont==12) year<=year+1;
        else year<=year;
    end
endmodule
