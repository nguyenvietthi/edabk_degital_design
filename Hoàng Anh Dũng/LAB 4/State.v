module State(
    input               clk,
    input               rst,
    input       [0:0]   car,
    input       [0:0]   timeout_state1,
    input       [0:0]   timeout_state2,
    input       [0:0]   timeout_state3,
    output reg  [1:0]   hw_color,
    output reg  [1:0]   ct_color,
	output reg	[1:0]   state_now
    );
    
    localparam [1:0]        //Trang thai
        GreenRed    = 2'b00,
        YellowRed   = 2'b01,
        RedGreen    = 2'b10,
        RedYellow   = 2'b11;
    /* HW   - CtR
	0. Xanh - do	99
	1. vang - do	3
	2. do	- Xanh	20
	3. do	- vang 	3
	*/
    localparam [1:0]        //Mau den
        GREEN   = 2'b00, 
        RED     = 2'b01,
        YELLOW  = 2'b10;      
	reg[1:0] state_next;

    always@(posedge clk or negedge rst) begin			//luon phai dung <=
        if(!rst) begin state_now <= GreenRed; end
        else begin state_now <= state_next; end
    end
    
    // always@(*) means "build the sensitivity list for me", danh sach do nhay chi la cac gia tri input thay doi
    always@(*) begin          
        state_next = state_now;
        case(state_now)
            GreenRed: begin
                hw_color = GREEN; ct_color = RED;
                if(car) begin state_next = YellowRed; end
                else begin state_next = GreenRed; end
            end
            
            YellowRed: begin
                hw_color = YELLOW; ct_color = RED;
                if(timeout_state1) begin state_next = RedGreen; end
                else begin state_next = YellowRed; end
            end
            
            RedGreen: begin
                hw_color = RED; ct_color = GREEN;
                if(timeout_state2) begin state_next = RedYellow; end
                else begin state_next = RedGreen; end
            end
            
            RedYellow: begin
                hw_color = RED; ct_color = YELLOW;
                if(timeout_state3) begin state_next = GreenRed; end
                else begin state_next = RedYellow; end
            end
            
            default: begin
                hw_color = YELLOW; ct_color = YELLOW;
                state_next = GreenRed;
            end
        endcase
    end
endmodule
