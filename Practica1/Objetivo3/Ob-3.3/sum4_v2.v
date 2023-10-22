module sum4_v2(output wire[3:0] S, output wire c_out, input wire[3:0] A, input wire[3:0] B, input wire c_in);

  wire c_1, c_11, c_12, c_2, c_21, c_22, c_3, c_31, c_32, c_41, c_42;
  wire sum_1, sum_2, sum_3, sum_4;

  assign {c_11, sum_1} = A[0] + B[0];
  assign {c_12, S[0]} = c_in + sum_1;
  or or_1(c_1, c_11, c_12);

  assign {c_21, sum_2} = A[1] + B[1];
  assign {c_22, S[1]} = c_1 + sum_2;
  or or_2(c_2, c_21, c_22);
  
  assign {c_31, sum_3} = A[2] + B[2];
  assign {c_32, S[2]} = c_2 + sum_3;
  or or_3(c_3, c_31, c_32);

  assign {c_41, sum_4} = A[3] + B[3];
  assign {c_42, S[3]} = c_3 + sum_4;
  or or_4(c_out, c_41, c_42);

endmodule
