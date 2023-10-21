module fa(output wire c_out, sum, input wire a, b, c_in);

  wire c1, c2, sum1;

  assign {c1, sum1} = a + b;
  assign {c2, sum} = c_in + sum1;

  or orion(c_out, c2, c1);

endmodule