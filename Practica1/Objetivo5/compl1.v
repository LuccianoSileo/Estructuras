module compl1(output wire [3:0] Out, input wire [3:0] Inp, input wire cpl);

  wire [3:0] oscuro;
  not lo(oscuro[0], Inp[0]);
  not lolo(oscuro[1], Inp[1]);
  not lololo(oscuro[2], Inp[2]);
  not lolololo(oscuro[3], Inp[3]);
  assign Out = ((cpl == 1'b0) ? Inp : oscuro);

endmodule