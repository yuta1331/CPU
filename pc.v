module pc(pc_in, pc_out, rst_n, clk, we);
	input wire rst_n, clk, we;
	input wire [7:0] pc_in;
	output reg [7:0] pc_out;

	always @(posedge clk) begin
		if(!rst_n) begin
			pc_out <= 0;
		end else begin
			if(we) begin
				pc_out <= pc_in;
			end else begin
				pc_out <= pc_out + 1;
			end
		end
	end
endmodule
