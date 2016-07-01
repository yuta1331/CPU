`timescale 1ps/1ps


module test;
	reg clk, rst_n;
	wire [23:0] mem0, mem1, mem2, mem3, mem4, mem5, mem6, mem7, mem8, mem9, mem10, mem11, mem12, mem13, mem14, mem15, mem16, mem17, mem18;

	parameter STEP = 10;
	always #(STEP/2) clk = ~clk;

	top top0(clk, rst_n, mem0, mem1, mem2, mem3, mem4, mem5, mem6, mem7, mem8, mem9, mem10, mem11, mem12, mem13, mem14, mem15, mem16, mem17, mem18);

	initial begin
		$dumpfile("test.vcd");
		$dumpvars(0, top0);
		$dumplimit(100000000);
		$monitor($stime, "0:%b 1:%b 2:%b 3:%b 4:%b 5:%b 6:%b 7:%b 8:%b 9:%b 10:%b 11:%b 12:%b 13:%b 14:%b", mem0, mem1, mem2, mem3, mem4, mem5, mem6, mem7, mem8, mem9, mem10, mem11, mem12, mem13, mem14);
		rst_n = 0;
		clk = 0;
	#STEP
		rst_n = 1;
	#(STEP*100000000)
	$finish;
	end
endmodule
