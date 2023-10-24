module alu(output wire [3:0] R, output wire zero, c_out, sign, input wire [3:0] A, B, input wire c_in, input wire [1:0] ALUOP, input wire l);
  // Cables de estado
  wire add1, op1_A, op2_B, cpl;

  // Asignaciones
  assign add1 = ALUOP[0];
  assign op1_A = l | (ALUOP[1] & ~ALUOP[0]);
  assign op2_B = l | (ALUOP[1] & ~ALUOP[0]);
  assign cpl = ~l & ~ALUOP[1] & ALUOP[0];
  assign zero = ((R == 4'b0000)? 1'b1 : 1'b0);
  assign sign = R[3];
  //Cables de conexción
  wire [3:0] add1_to_op1_A, op2_B_to_cpl, sum4_to_end, ul4_to_end;

  //Cables existentes 
  wire [3:0] OP1, OP2;

  // Multiplexores
  mux2_4 mux_add1(add1_to_op1_A, 4'b0000, 4'b0001, add1);
  mux2_4 mux_op1_a(OP1, add1_to_op1_A, A, op1_A);
  mux2_4 mux_op2_b(op2_B_to_cpl, A, B, op2_B);
  mux2_4 mux_l(R, sum4_to_end, ul4_to_end, l);

  // Complemento a 1
  compl1 compl1(OP2, op2_B_to_cpl, cpl);

  // Sumador
  sum4 sum5(sum4_to_end, c_out ,OP1, OP2, c_in);

  // Unidad lógica 
  ul4 alucinogeno(ul4_to_end, OP1, OP2, ALUOP);


endmodule