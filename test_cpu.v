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
		$monitor($stime, "mem0:%d mem1:%d mem2:%d mem3:%d mem4:%d mem5:%d mem6:%d mem7:%d mem8:%d mem9:%d", mem0, mem1, mem2, mem3, mem4, mem5, mem6, mem7, mem8, mem9);
		rst_n = 0;
		clk = 0;
	#STEP
		rst_n = 1;
	#(STEP*100000000)
	$finish;
	end
endmodule
