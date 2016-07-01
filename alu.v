module alu(in0, in1, op, zf, out);
	input wire [23:0] in0, in1;
	input wire [3:0] op;
	output reg zf;
	output reg [23:0] out;

`include "def.h"

always @(*) begin
	case (op)
/*
	AND : begin
		out <= in0 & in1;
		zf <= 0;
	end

	OR : begin
		out <= in0 | in1;
		zf <= 0;
	end

	ADD : begin
		out <= in0 + in1;
		zf <= 0;
	end

	SUB : begin
		out <= (in0 > in1) ? in0 - in1 : in1 - in0;
		zf <= 0;
	end
*/

	INC : begin
		out <= in1 + 1;
		zf <= 0;
	end

	DEC : begin
		out <= in1 - 1;
		zf <= 0;
	end

	COMP : begin
		out <= 0;
		zf <= (in0 == in1) ? 1 : 0;
	end

	CHECK : begin
		out <= 0;
		zf <= (in0 == in1) ? 1 : 0;
	end

	LOAD : begin
		out <= in0;
		zf <= 0;
	end

	STORE : begin
		out <= in0;
		zf <= 0;
	end

/*
	LI : begin
		out <= in0;
		zf <= 0;
	end
*/

	RTX0 : begin
		out <= {in1[19:18], in1[21:20], in1[15:14], in1[17:16], in1[11:10], in1[13:12], in1[23:22], in1[9:8], in1[4], in1[7:5], in1[3:0]};
		zf <= 0;
	end

/*
	RTX1 : begin
		out <= {in1[15:14], in1[21:20], in1[11:10], in1[17:16], in1[23:22], in1[13:12], in1[19:18], in1[9:8], in1[5:4], in1[7:6], in1[3:0]};
		zf <= 0;
	end
*/

	RTX2 : begin
		out <= {in1[11:10], in1[21:20], in1[23:22], in1[17:16], in1[19:18], in1[13:12], in1[15:14], in1[9:8], in1[6:4], in1[7], in1[3:0]};
		zf <= 0;
	end

	RTY0 : begin
		out <= {in1[22:20], in1[23], in1[3], in1[18:17], in1[0], in1[15:11], in1[4], in1[7], in1[8], in1[19], in1[6:5], in1[16], in1[9], in1[2:1], in1[10]};
		zf <= 0;
	end

/*
	RTY1 : begin
		out <= {in1[21:20], in1[23:22], in1[9], in1[18:17], in1[10], in1[15:11], in1[16], in1[19], in1[8], in1[3], in1[6:5], in1[0], in1[7], in1[2:1], in1[4]};
		zf <= 0;
	end
*/

	RTY2 : begin
		out <= {in1[20], in1[23:21], in1[7], in1[18:17], in1[4], in1[15:11], in1[0], in1[3], in1[8], in1[9], in1[6:5], in1[10], in1[19], in1[2:1], in1[16]};
		zf <= 0;
	end

	RTZ0 : begin
		out <= {in1[23], in1[3:2], in1[20], in1[16], in1[19:17], in1[4], in1[14:13], in1[5], in1[11:6], in1[22:21], in1[12], in1[15], in1[1:0]};
		zf <= 0;
	end

/*
	RTZ1 : begin
		out <= {in1[23], in1[12], in1[15], in1[20], in1[17:16], in1[19:18], in1[21], in1[14:13], in1[22], in1[11:6], in1[3:2], in1[5:4], in1[1:0]};
		zf <= 0;
	end
*/

	RTZ2 : begin
		out <= {in1[23], in1[5:4], in1[20], in1[18:16], in1[19], in1[2], in1[14:13], in1[3], in1[11:6], in1[12], in1[15], in1[22:21], in1[1:0]};
		zf <= 0;
	end

	D_ADD : begin
		out <= in0 + in1;
		zf <= 0;
	end

	endcase
end
endmodule
