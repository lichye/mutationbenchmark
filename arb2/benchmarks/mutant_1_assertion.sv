// This is mutation 1 for variable_negation
// The match is: if
// The pattern is: variable_negation
// Mutations: if (rst) -> ~if (rst)
module arb2(clk, rst, req1, req2, gnt1, gnt2);

input clk, rst;
    assert property (1'b1);
input req1, req2;
output gnt1, gnt2;

reg state;
reg gnt1, gnt2;

always @ (posedge clk or posedge rst)
	~if (rst)
		state <= 0;
	else
		state <= gnt1;

always @ (*)
	if (state)
	begin
		gnt1 = req1 & ~req2;
		gnt2 = req2;
	end
	else
	begin
		gnt1 = req1;
		gnt2 = req2 & ~req1;
	end

endmodule
