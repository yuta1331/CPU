/*
*	[15:12] alu_op
*	[11:8]  dst
*	[7:4]   src1
*	[3:0]   src0
*/
module decoder(op, zf, pc_in, pc_we, src0, src1, dst, reg_we, sel0, sel1, data, alu_op, mem_we);
	input wire [15:0] op;
	input wire zf;
	output reg [7:0] pc_in;
	output reg pc_we;
	output reg [3:0] src0, src1, dst;
	output reg reg_we;
	output reg sel0, sel1;
	output reg [23:0] data;
	output reg [3:0] alu_op;
	output reg mem_we;

`include "def.h"

always @(*) begin
	case (op[15:12])
/*
	AND : begin
		alu_op <= op[15:12];
		dst <= op[11:8];
		src1 <= op[7:4];
		src0 <= op[3:0];
		pc_in <= 0;
		pc_we <= 0;
		reg_we <= 1;
		sel0 <= 1;
		sel1 <= 0;
		data <= 0;
		mem_we <= 0;
	end

	OR : begin
		alu_op <= op[15:12];
		dst <= op[11:8];
		src1 <= op[7:4];
		src0 <= op[3:0];
		pc_in <= 0;
		pc_we <= 0;
		reg_we <= 1;
		sel0 <= 1;
		sel1 <= 0;
		data <= 0;
		mem_we <= 0;
	end

	ADD : begin
		alu_op <= op[15:12];
		dst <= op[11:8];
		src1 <= op[7:4];
		src0 <= op[3:0];
		pc_in <= 0;
		pc_we <= 0;
		reg_we <= 1;
		sel0 <= 1;
		sel1 <= 0;
		data <= 0;
		mem_we <= 0;
	end

	SUB : begin
		alu_op <= op[15:12];
		dst <= op[11:8];
		src1 <= op[7:4];
		src0 <= op[3:0];
		pc_in <= 0;
		pc_we <= 0;
		reg_we <= 1;
		sel0 <= 1;
		sel1 <= 0;
		data <= 0;
		mem_we <= 0;
	end
*/

	INC : begin
		alu_op <= op[15:12];
		dst <= op[11:8];
		src1 <= op[7:4];
		src0 <= op[3:0];
		pc_in <= 0;
		pc_we <= 0;
		reg_we <= 1;
		sel0 <= 1;
		sel1 <= 0;
		data <= 0;
		mem_we <= 0;
	end

	DEC : begin
		alu_op <= op[15:12];
		dst <= op[11:8];
		src1 <= op[7:4];
		src0 <= op[3:0];
		pc_in <= 0;
		pc_we <= 0;
		reg_we <= 1;
		sel0 <= 1;
		sel1 <= 0;
		data <= 0;
		mem_we <= 0;
	end

	COMP : begin//レジスタ内の2つを比較する
		alu_op <= op[15:12];
		dst <= 0;
		src1 <= op[7:4];
		src0 <= op[3:0];
		pc_in <= 0;
		pc_we <= 0;
		reg_we <= 0;
		sel0 <= 1;
		sel1 <= 0;
		data <= 0;
		mem_we <= 0;
	end

	CHECK : begin//レジスタ内の1つの値をチェックにかける
		alu_op <= op[15:12];
		dst <= 0;
		src1 <= op[11:8];
		src0 <= 0;
		pc_in <= 0;
		pc_we <= 0;
		reg_we <= 0;
		sel0 <= 0;
		sel1 <= 0;
		data <= {16'b0000_0000_0000_0000, op[7:0]};
		mem_we <= 0;
	end

	LOAD : begin
		alu_op <= op[15:12];
		dst <= op[11:8];
		src1 <= op[7:4];
		src0 <= 0;
		pc_in <= 0;
		pc_we <= 0;
		reg_we <= 1;
		sel0 <= 1;
		sel1 <= 1;
		data <= 0;
		mem_we <= 0;
	end

	STORE : begin
		alu_op <= op[15:12];
		dst <= 0;
		src1 <= op[7:4];
		src0 <= op[3:0];
		pc_in <= 0;
		pc_we <= 0;
		reg_we <= 0;
		sel0 <= 1;
		sel1 <= 0;
		data <= 0;
		mem_we <= 1;
	end

/*
	LI : begin
		alu_op <= op[15:12];
		dst <= op[11:8];
		src1 <= 0;
		src0 <= 0;
		pc_in <= 0;
		pc_we <= 0;
		reg_we <= 1;
		sel0 <= 0;
		sel1 <= 0;
		data <= {16'b0000_0000_0000_0000, op[7:0]};
		mem_we <= 0;
	end
*/

	JMP : begin
		alu_op <= op[15:12];
		dst <= 0;
		src1 <= 0;
		src0 <= 0;
		pc_in <= op[7:0];
		pc_we <= 1;
		reg_we <= 0;
		sel0 <= 1;
		sel1 <= 0;
		data <= 0;
		mem_we <= 0;
	end

	JNZ : begin// if true
		alu_op <= op[15:12];
		dst <= 0;
		src1 <= 0;
		src0 <= 0;
		pc_in <= op[7:0];
		pc_we <= zf;
		reg_we <= 0;
		sel0 <= 1;
		sel1 <= 0;
		data <= 0;
		mem_we <= 0;
	end

	JNO : begin// if false
		alu_op <= op[15:12];
		dst <= 0;
		src1 <= 0;
		src0 <= 0;
		pc_in <= op[7:0];
		pc_we <= ~zf;
		reg_we <= 0;
		sel0 <= 1;
		sel1 <= 0;
		data <= 0;
		mem_we <= 0;
	end

	RTX0 : begin
		alu_op <= op[15:12];
		dst <= op[11:8];
		src1 <= op[7:4];
		src0 <= 0;
		pc_in <= 0;
		pc_we <= 0;
		reg_we <= 1;
		sel0 <= 1;
		sel1 <= 0;
		data <= 0;
		mem_we <= 0;
	end

/*
	RTX1 : begin
		alu_op <= op[15:12];
		dst <= op[11:8];
		src1 <= op[7:4];
		src0 <= 0;
		pc_in <= 0;
		pc_we <= 0;
		reg_we <= 1;
		sel0 <= 1;
		sel1 <= 0;
		data <= 0;
		mem_we <= 0;
	end
*/

	RTX2 : begin
		alu_op <= op[15:12];
		dst <= op[11:8];
		src1 <= op[7:4];
		src0 <= 0;
		pc_in <= 0;
		pc_we <= 0;
		reg_we <= 1;
		sel0 <= 1;
		sel1 <= 0;
		data <= 0;
		mem_we <= 0;
	end

	RTY0 : begin
		alu_op <= op[15:12];
		dst <= op[11:8];
		src1 <= op[7:4];
		src0 <= 0;
		pc_in <= 0;
		pc_we <= 0;
		reg_we <= 1;
		sel0 <= 1;
		sel1 <= 0;
		data <= 0;
		mem_we <= 0;
	end

/*
	RTY1 : begin
		alu_op <= op[15:12];
		dst <= op[11:8];
		src1 <= op[7:4];
		src0 <= 0;
		pc_in <= 0;
		pc_we <= 0;
		reg_we <= 1;
		sel0 <= 1;
		sel1 <= 0;
		data <= 0;
		mem_we <= 0;
	end
*/

	RTY2 : begin
		alu_op <= op[15:12];
		dst <= op[11:8];
		src1 <= op[7:4];
		src0 <= 0;
		pc_in <= 0;
		pc_we <= 0;
		reg_we <= 1;
		sel0 <= 1;
		sel1 <= 0;
		data <= 0;
		mem_we <= 0;
	end

	RTZ0 : begin
		alu_op <= op[15:12];
		dst <= op[11:8];
		src1 <= op[7:4];
		src0 <= 0;
		pc_in <= 0;
		pc_we <= 0;
		reg_we <= 1;
		sel0 <= 1;
		sel1 <= 0;
		data <= 0;
		mem_we <= 0;
	end

/*
	RTZ1 : begin
		alu_op <= op[15:12];
		dst <= op[11:8];
		src1 <= op[7:4];
		src0 <= 0;
		pc_in <= 0;
		pc_we <= 0;
		reg_we <= 1;
		sel0 <= 1;
		sel1 <= 0;
		data <= 0;
		mem_we <= 0;
	end
*/

	RTZ2 : begin
		alu_op <= op[15:12];
		dst <= op[11:8];
		src1 <= op[7:4];
		src0 <= 0;
		pc_in <= 0;
		pc_we <= 0;
		reg_we <= 1;
		sel0 <= 1;
		sel1 <= 0;
		data <= 0;
		mem_we <= 0;
	end

	D_ADD : begin
		alu_op <= op[15:12];
		dst <= op[11:8];
		src1 <= op[7:4];
		src0 <= 0;
		pc_in <= 0;
		pc_we <= 0;
		reg_we <= 1;
		sel0 <= 0;
		sel1 <= 0;
		data <= {16'b0000_0000_0000_0000, op[3:0]};
		mem_we <= 0;
	end

	default : begin
		pc_we <= 0;
	end
	endcase
end
endmodule
