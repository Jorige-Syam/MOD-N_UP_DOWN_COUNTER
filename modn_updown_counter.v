module modn_updown_counter #(
    parameter N     = 10,
    parameter WIDTH = $clog2(N)
)(
    input  wire clk,
    input  wire rst,     
	input  wire up_down, // 1 = Up, 0 = Down
    output reg  [WIDTH-1:0] count
);

    localparam [WIDTH-1:0] COUNT_ZERO = {WIDTH{1'b0}};
    localparam [WIDTH-1:0] MAX_COUNT  = N - 1;
    localparam [WIDTH-1:0] COUNT_ONE  = {{WIDTH-1{1'b0}}, 1'b1};

    always @(posedge clk) begin
        if (rst) begin
        	count <= COUNT_ZERO; 
        end 
		else if (up_down) begin
            // Up-counter logic
            if (count >= MAX_COUNT) begin
                count <= COUNT_ZERO;
            end 
			else begin
                count <= count + COUNT_ONE;
            end
        end 
		else begin
            // Down-counter logic
            if ((count == COUNT_ZERO) || (count > MAX_COUNT)) begin
                count <= MAX_COUNT;
            end else begin
                count <= count - COUNT_ONE;
            end
        end
    end
endmodule

