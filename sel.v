module sel(in1, in0, sel, out);
	input wire [23:0] in1, in0;
	input wire sel;
	output wire [23:0] out;

assign out = (sel)? in1 : in0;
endmodule
