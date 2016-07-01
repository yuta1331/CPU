module imem(pc, op);
	input wire [7:0] pc;
	output reg [15:0] op;

`include "def.h"

always @(pc) begin
	case (pc)

// comp
	0 : begin
		op[15:12] <= COMP;
		op[11:8] <= 0;//dc
		op[7:4] <= 0;//src1
		op[3:0] <= 10;//src0
	end

	1 : begin
		op[15:12] <= JNO;
		op[11:8] <= 0;//dc
		op[7:0] <= 6;//go to 6
	end

	2 : begin
		op[15:12] <= COMP;
		op[11:8] <= 0;//dc
		op[7:4] <= 1; //src1
		op[3:0] <= 11; //src0
	end

	3 : begin
		op[15:12] <= JNO;
		op[11:8] <= 0;//dc
		op[7:0] <= 6; // go to 6
	end

	4 : begin
		op[15:12] <= COMP;
		op[11:8] <= 0;//dc
		op[7:4] <= 2; // src1
		op[3:0] <= 12; // src0
	end

	5 : begin // if perfect
		op[15:12] <= JNZ;
		op[11:8] <= 0;//dc
		op[7:0] <= 77; // go to 77
	end

// x route
	6 : begin
		op[15:12] <= RTX0;
		op[11:8] <= 0;
		op[7:4] <= 0;
		op[3:0] <= 0;//dc
	end

	7 : begin
		op[15:12] <= RTX0;
		op[11:8] <= 1;
		op[7:4] <= 1;
		op[3:0] <= 0;//dc
	end

	8 : begin
		op[15:12] <= RTX0;
		op[11:8] <= 2;
		op[7:4] <= 2;
		op[3:0] <= 0;//dc
	end

// x footprint
	9 : begin
		op[15:12] <= STORE;
		op[11:8] <= 0;// dc
		op[7:4] <= 6;// src1
		op[3:0] <= 7;// src0
	end

// depth dec
	10 : begin
		op[15:12] <= DEC;
		op[11:8] <= 6; // dst
		op[7:4] <= 6; // src1
		op[3:0] <= 0; // dc
	end

// comp
	11 : begin
		op[15:12] <= COMP;
		op[11:8] <= 0;//dc
		op[7:4] <= 0;//src1
		op[3:0] <= 10;//src0
	end

	12 : begin
		op[15:12] <= JNO;
		op[11:8] <= 0;//dc
		op[7:0] <= 17;//go to 17
	end

	13 : begin
		op[15:12] <= COMP;
		op[11:8] <= 0;//dc
		op[7:4] <= 1; //src1
		op[3:0] <= 11; //src0
	end

	14 : begin
		op[15:12] <= JNO;
		op[11:8] <= 0;//dc
		op[7:0] <= 17; // go to 17
	end

	15 : begin
		op[15:12] <= COMP;
		op[11:8] <= 0;//dc
		op[7:4] <= 2; // src1
		op[3:0] <= 12; // src0
	end

	16 : begin // if perfect
		op[15:12] <= JNZ;
		op[11:8] <= 0;//dc
		op[7:0] <= 77;// go to 77
	end

// depth check
	17 : begin
		op[15:12] <= CHECK;
		op[11:8] <= 6; // src1
		op[7:0] <= 0; // depth = 0
	end

	18 : begin
		op[15:12] <= JNO;
		op[11:6] <= 0; // dc
		op[7:0] <= 6; // go to 6
	end

//reverse x
	19 : begin
		op[15:12] <= RTX2;
		op[11:8] <= 0;
		op[7:4] <= 0;
		op[3:0] <= 0;//dc
	end

	20 : begin
		op[15:12] <= RTX2;
		op[11:8] <= 1;
		op[7:4] <= 1;
		op[3:0] <= 0;//dc
	end

	21 : begin
		op[15:12] <= RTX2;
		op[11:8] <= 2;
		op[7:4] <= 2;
		op[3:0] <= 0;//dc
	end

// depth raise
	22 : begin
		op[15:12] <= INC;
		op[11:8] <= 6; // dst
		op[7:4] <= 6; // src1
		op[3:0] <= 0; // dc
	end

// y route
	23 : begin
		op[15:12] <= RTY0;
		op[11:8] <= 0;
		op[7:4] <= 0;
		op[3:0] <= 0;//dc
	end

	24 : begin
		op[15:12] <= RTY0;
		op[11:8] <= 1;
		op[7:4] <= 1;
		op[3:0] <= 0;//dc
	end

	25 : begin
		op[15:12] <= RTY0;
		op[11:8] <= 2;
		op[7:4] <= 2;
		op[3:0] <= 0;//dc
	end

// y footprint
	26 : begin
		op[15:12] <= STORE;
		op[11:8] <= 0;// dc
		op[7:4] <= 6;// src1
		op[3:0] <= 8;// src0
	end

// depth dec
	27 : begin
		op[15:12] <= DEC;
		op[11:8] <= 6; // dst
		op[7:4] <= 6; // src1
		op[3:0] <= 0; // dc
	end

// comp
	28 : begin
		op[15:12] <= COMP;
		op[11:8] <= 0;//dc
		op[7:4] <= 0;//src1
		op[3:0] <= 10;//src0
	end

	29 : begin
		op[15:12] <= JNO;
		op[11:8] <= 0;//dc
		op[7:0] <= 34;//go to 34
	end

	30 : begin
		op[15:12] <= COMP;
		op[11:8] <= 0;//dc
		op[7:4] <= 1; //src1
		op[3:0] <= 11; //src0
	end

	31 : begin
		op[15:12] <= JNO;
		op[11:8] <= 0;//dc
		op[7:0] <= 34; // go to 34
	end

	32 : begin
		op[15:12] <= COMP;
		op[11:8] <= 0;//dc
		op[7:4] <= 2; // src1
		op[3:0] <= 12; // src0
	end

	33 : begin // if perfect
		op[15:12] <= JNZ;
		op[11:8] <= 0;//dc
		op[7:0] <= 77;// go to 77
	end

// depth check
	34 : begin
		op[15:12] <= CHECK;
		op[11:8] <= 6; // src1
		op[7:0] <= 0; // depth = 0
	end

	35 : begin
		op[15:12] <= JNO;
		op[11:6] <= 0; // dc
		op[7:0] <= 6; // go to 6
	end

//reverse y
	36 : begin
		op[15:12] <= RTY2;
		op[11:8] <= 0;
		op[7:4] <= 0;
		op[3:0] <= 0;//dc
	end

	37 : begin
		op[15:12] <= RTY2;
		op[11:8] <= 1;
		op[7:4] <= 1;
		op[3:0] <= 0;//dc
	end

	38 : begin
		op[15:12] <= RTY2;
		op[11:8] <= 2;
		op[7:4] <= 2;
		op[3:0] <= 0;//dc
	end

// depth raise
	39 : begin
		op[15:12] <= INC;
		op[11:8] <= 6; // dst
		op[7:4] <= 6; // src1
		op[3:0] <= 0; // dc
	end

// z route
	40 : begin
		op[15:12] <= RTZ0;
		op[11:8] <= 0;
		op[7:4] <= 0;
		op[3:0] <= 0;//dc
	end

	41 : begin
		op[15:12] <= RTZ0;
		op[11:8] <= 1;
		op[7:4] <= 1;
		op[3:0] <= 0;//dc
	end

	42 : begin
		op[15:12] <= RTZ0;
		op[11:8] <= 2;
		op[7:4] <= 2;
		op[3:0] <= 0;//dc
	end

// z footprint
	43 : begin
		op[15:12] <= STORE;
		op[11:8] <= 0;// dc
		op[7:4] <= 6;// src1
		op[3:0] <= 9;// src0
	end

// depth dec
	44 : begin
		op[15:12] <= DEC;
		op[11:8] <= 6; // dst
		op[7:4] <= 6; // src1
		op[3:0] <= 0; // dc
	end

// comp
	45 : begin
		op[15:12] <= COMP;
		op[11:8] <= 0;//dc
		op[7:4] <= 0;//src1
		op[3:0] <= 10;//src0
	end

	46 : begin
		op[15:12] <= JNO;
		op[11:8] <= 0;//dc
		op[7:0] <= 51;//go to 51
	end

	47 : begin
		op[15:12] <= COMP;
		op[11:8] <= 0;//dc
		op[7:4] <= 1; //src1
		op[3:0] <= 11; //src0
	end

	48 : begin
		op[15:12] <= JNO;
		op[11:8] <= 0;//dc
		op[7:0] <= 51; // go to 51
	end

	49 : begin
		op[15:12] <= COMP;
		op[11:8] <= 0;//dc
		op[7:4] <= 2; // src1
		op[3:0] <= 12; // src0
	end

	50 : begin // if perfect
		op[15:12] <= JNZ;
		op[11:8] <= 0;//dc
		op[7:0] <= 77;// go to 77
	end

// depth check
	51 : begin
		op[15:12] <= CHECK;
		op[11:8] <= 6; // src1
		op[7:0] <= 0; // src0 // depth = 0
	end

	52 : begin
		op[15:12] <= JNO;
		op[11:6] <= 0; // dc
		op[7:0] <= 6; // go to 6
	end

//reverse z
	53 : begin
		op[15:12] <= RTZ2;
		op[11:8] <= 0;
		op[7:4] <= 0;
		op[3:0] <= 0;//dc
	end

	54 : begin
		op[15:12] <= RTZ2;
		op[11:8] <= 1;
		op[7:4] <= 1;
		op[3:0] <= 0;//dc
	end

	55 : begin
		op[15:12] <= RTZ2;
		op[11:8] <= 2;
		op[7:4] <= 2;
		op[3:0] <= 0;//dc
	end

// depth raise
	56 : begin
		op[15:12] <= INC;
		op[11:8] <= 6; // dst
		op[7:4] <= 6; // src1
		op[3:0] <= 0; // dc
	end

// depth raise
	57 : begin
		op[15:12] <= INC;
		op[11:8] <= 6; // dst
		op[7:4] <= 6; // src1
		op[3:0] <= 0; // dc
	end

// load last rout
	58 : begin
		op[15:12] <= LOAD;
		op[11:8] <= 13;// dst
		op[7:4] <= 6;// src1
		op[3:0] <= 0;// dc
	end

// comp last rout
//x
	59 : begin
		op[15:12] <= COMP;
		op[11:8] <= 0;// dc
		op[7:4] <= 7;
		op[3:0] <= 13;
	end

	60 : begin
		op[15:12] <= JNO;
		op[11:8] <= 0;//dc
		op[7:0] <= 65; // go to 65
	end

	//reverse x
	61 : begin
		op[15:12] <= RTX2;
		op[11:8] <= 0;
		op[7:4] <= 0;
		op[3:0] <= 0;//dc
	end

	62 : begin
		op[15:12] <= RTX2;
		op[11:8] <= 1;
		op[7:4] <= 1;
		op[3:0] <= 0;//dc
	end

	63 : begin
		op[15:12] <= RTX2;
		op[11:8] <= 2;
		op[7:4] <= 2;
		op[3:0] <= 0;//dc
	end

	64 : begin
		op[15:12] <= JMP;
		op[11:8] <= 0;// dc
		op[7:0] <= 23;// go to 23
	end

// comp last rout
//y
	65 : begin
		op[15:12] <= COMP;
		op[11:8] <= 0;// dc
		op[7:4] <= 8;
		op[3:0] <= 13;
	end

	66 : begin
		op[15:12] <= JNO;
		op[11:8] <= 0;//dc
		op[7:0] <= 71; // go to 71
	end

	//reverse y
	67 : begin
		op[15:12] <= RTY2;
		op[11:8] <= 0;
		op[7:4] <= 0;
		op[3:0] <= 0;//dc
	end

	68 : begin
		op[15:12] <= RTY2;
		op[11:8] <= 1;
		op[7:4] <= 1;
		op[3:0] <= 0;//dc
	end

	69 : begin
		op[15:12] <= RTY2;
		op[11:8] <= 2;
		op[7:4] <= 2;
		op[3:0] <= 0;//dc
	end

	70 : begin
		op[15:12] <= JMP;
		op[11:8] <= 0;// dc
		op[7:0] <= 40;// go to 40
	end

// comp last rout
//z
	71 : begin
		op[15:12] <= COMP;
		op[11:8] <= 0;// dc
		op[7:4] <= 9;
		op[3:0] <= 13;
	end

	72 : begin
		op[15:12] <= JNO;
		op[11:8] <= 0;//dc
		op[7:0] <= 77; // go to 77
	end

	//reverse z
	73 : begin
		op[15:12] <= RTZ2;
		op[11:8] <= 0;
		op[7:4] <= 0;
		op[3:0] <= 0;//dc
	end

	74 : begin
		op[15:12] <= RTZ2;
		op[11:8] <= 1;
		op[7:4] <= 1;
		op[3:0] <= 0;//dc
	end

	75 : begin
		op[15:12] <= RTZ2;
		op[11:8] <= 2;
		op[7:4] <= 2;
		op[3:0] <= 0;//dc
	end

	76 : begin
		op[15:12] <= JMP;
		op[11:8] <= 0;// dc
		op[7:0] <= 57;// go to 57
	end

// end
	77 : begin
		op[15:12] <= STORE;
		op[11:8] <= 0;// dc
		op[7:4] <= 6;// src1
		op[3:0] <= 14;// src0
	end

	78 : begin
		op[15:12] <= JMP;
		op[11:8] <= 0;//dc
		op[7:0] <= 78;
	end

	endcase
end
endmodule
