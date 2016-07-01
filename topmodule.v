module top(clk, rst_n, mem0, mem1, mem2, mem3, mem4, mem5, mem6, mem7, mem8, mem9, mem10, mem11, mem12, mem13, mem14, mem15, mem16, mem17, mem18);//ほかのモジュールの配線をつなぐ
	input wire clk, rst_n;
	output wire [23:0] mem0, mem1, mem2, mem3, mem4, mem5, mem6, mem7, mem8, mem9, mem10, mem11, mem12, mem13, mem14, mem15, mem16, mem17, mem18;

	wire [7:0] pc_in, pc_out;
	wire pc_we;
	wire [15:0] op;
	wire [23:0] dec_d;
	wire [3:0] dst, src0, src1, alu_op;
	wire reg_we, sel0, sel1, mem_we;
	wire [23:0] data0, data1, regis_d, sel0_out;
	wire [23:0] alu_out;
	wire zf_in, zf_out;
	wire [23:0] dout;

//pc
pc pc0(.pc_in(pc_in), .pc_out(pc_out), .rst_n(rst_n), .clk(clk), .we(pc_we));

//imem
imem imem0(.pc(pc_out), .op(op));

//decoder
decoder dec0(.op(op), .zf(zf_out), .pc_in(pc_in), .pc_we(pc_we), .src0(src0), .src1(src1), .dst(dst), .reg_we(reg_we), .sel0(sel0), .sel1(sel1), .data(dec_d), .alu_op(alu_op), .mem_we(mem_we));

//register
register regis0(.src0(src0), .src1(src1), .dst(dst), .we(reg_we), .data0(data0), .data1(data1), .data(regis_d), .clk(clk), .rst_n(rst_n));

//sel
sel s0(.in0(dec_d), .in1(data0), .sel(sel0), .out(sel0_out));
sel s1(.in0(alu_out), .in1(dout), .sel(sel1), .out(regis_d));

//alu
alu alu0(.in0(sel0_out), .in1(data1), .op(alu_op), .zf(zf_in), .out(alu_out));

//memory
memory memo0(.clk(clk), .rst_n(rst_n), .din(alu_out), .addr(data1), .we(mem_we), .dout(dout), .mem0(mem0), .mem1(mem1), .mem2(mem2), .mem3(mem3), .mem4(mem4), .mem5(mem5), .mem6(mem6), .mem7(mem7), .mem8(mem8), .mem9(mem9), .mem10(mem10), .mem11(mem11), .mem12(mem12), .mem13(mem13), .mem14(mem14), .mem15(mem15), .mem16(mem16), .mem17(mem17), .mem18(mem18));

//zf
zf zf0(.clk(clk), .rst_n(rst_n), .zf_in(zf_in), .zf_out(zf_out));

endmodule
