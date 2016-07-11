module register(src0, src1, dst, we, data0, data1, data, clk, rst_n); input wire clk, rst_n;
	input wire [3:0] src0, src1;
	input wire [3:0] dst;
	input wire we;
	input wire [23:0] data;
	output wire [23:0] data0, data1;

	reg [23:0] regfile [15:0];
wire [23:0] white, red, blue, depth, lastrout;

`include "def.h"

always @(posedge clk) begin
if(!rst_n) begin
		regfile[0]  <= 24'b0000_0000_0000_1000_0011_0001;//white
		regfile[1]  <= 24'b1001_0001_1000_0000_0000_0000;//red
		regfile[2]  <= 24'b0010_1100_0000_0000_0000_0010;//blue
		regfile[3]  <= 3;//xcounter //no used
		regfile[4]  <= 3;//ycounter //no used
		regfile[5]  <= 3;//zcounter //no used
		regfile[6]  <= 9;//depth //memory's address
		regfile[7]  <= RTX0;//x_footprint
		regfile[8]  <= RTY0;//y_footprint
		regfile[9]  <= RTZ0;//z_footprint
		regfile[10] <= 24'b1111_0000_0000_0000_0000_0000;//white_answer
		regfile[11] <= 24'b0000_1111_0000_0000_0000_0000;//red_answer
		regfile[12] <= 24'b0000_0000_0000_0000_0000_1111;//blue_answer
		regfile[13] <= 0;// last rout
		regfile[14] <= 24'b0000_0000_0000_0000_1111_1111;//end
		regfile[15] <= 0;
	end else begin
		if(we) begin
			regfile[dst] <= data;
		end else begin
			regfile[dst] <= regfile[dst];
		end
	end
end

assign data0 = regfile[src0];
assign data1 = regfile[src1];

assign white = regfile[0];
assign red   = regfile[1];
assign blue  = regfile[2];
assign depth = regfile[6];
assign lastrout = regfile[13];

endmodule
