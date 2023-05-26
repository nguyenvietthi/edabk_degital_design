module Timer(
	input               clk,
	input               rst,
	input       [0:0]   car,
	input       [1:0]   state_now,
    output reg  [6:0]   hw_time,
    output reg  [6:0]   ct_time,
    output reg  [0:0]   timeout_state1,
    output reg  [0:0]   timeout_state2,
    output reg  [0:0]   timeout_state3
	);
	
	localparam [1:0] 
        GreenRed    = 2'b00,
        YellowRed   = 2'b01,
        RedGreen    = 2'b10,
        RedYellow   = 2'b11;
    localparam [1:0]
        GREEN   = 2'b00, 
        RED     = 2'b01,
        YELLOW  = 2'b10; 
        
	always@(posedge clk or negedge rst) begin
	    if(!rst) begin 
	        hw_time <= 99;
            ct_time <= 99;
			timeout_state1 <= 0;
			timeout_state2 <= 0;
			timeout_state3 <= 0;
	    end
	    else begin
        case(state_now)
            GreenRed: begin
                if (!car) begin
                    hw_time <= 99;
                    ct_time <= 99;
                end
                else begin
                    hw_time <= 3;
                    ct_time <= 3;
                end
            end
            YellowRed: begin
                //hw_time = 3; ct_time = 3;
				if (hw_time > 1) begin
					hw_time <= hw_time - 1;
					ct_time <= ct_time - 1;
					timeout_state1 <= 0;
				end
				else begin
				    hw_time <= 23;
                    ct_time <= 20;
					timeout_state1 <= 1;
				end
            end
            
            RedGreen: begin
                //hw_time = 23; ct_time = 20;
				if (ct_time > 1) begin
					hw_time <= hw_time - 1;
					ct_time <= ct_time - 1;
					timeout_state2 <= 0;
				end
				else begin
				    hw_time <= 3;
                    ct_time <= 3;
					timeout_state2 <= 1;
				end
            end
            
            RedYellow: begin
                //hw_time = 3; ct_time = 3;
				if (hw_time > 1) begin
					hw_time <= hw_time - 1;
					ct_time <= ct_time - 1;
					timeout_state3 <= 0;
				end
				else begin
				    hw_time <= 99;
                    ct_time <= 99;
					timeout_state3 <= 1;
				end
            end
            
            default: begin
                hw_time <= 88;
                ct_time <= 88;
            end
        endcase
        end
    end
endmodule