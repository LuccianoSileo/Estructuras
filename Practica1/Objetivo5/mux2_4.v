module mux2_4(output wire [3:0] Out, input wire [3:0] A, input wire [3:0] B, input wire s);

assign Out = (s == 1'b0 ? A : (s == 1'b1 ? B : 'bx));

endmodule