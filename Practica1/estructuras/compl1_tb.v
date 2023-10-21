`timescale 1 ns / 10 ps //Directiva que fija la unidad de tiempo de simulaci�n y el paso de simulaci�n

module compl1_tb;
//declaracion de se�ales

reg[3:0] Inp; //las se�ales de entrada al semisumador. Se han declarado reg porque queremos inicializarlas
reg cpl;
wire[3:0] Out;
integer i;

//instancia del modulo a testear, con notaci�n de posiciones de argumentos 
compl1 cpl1(Out, Inp, cpl);

//Lo siguiente comentado es una notaci�n alternativa para instanciar el m�dulo, los par�metros se denotan con un punto seguido del
//nombre del par�metro en la definici�n original del m�dulo y entre par�ntesis a qu� se conecta en el modulo actual
//no importa el orden de los par�metros definidos as� -?
//ha_v1 ha1(.a(test_a), .b(test_b), .sum(test_sum), .carry(test_carry)); 


initial
begin
  $monitor("tiempo=%0d Inp=%b cpl=%b Out=%b", $time, Inp, cpl, Out);
  $dumpfile("compl1_tb.vcd");
  $dumpvars;

  Inp = 4'b0;
  cpl = 1'b0;
  #5;

  //vector de test 0

  for (i = 5'd1; i < 32; i = i + 1) begin
    cpl = !cpl;
    if (i % 2 == 0) begin
      Inp[0] = !Inp[0];
    end
    if (i % 4 == 0) begin
      Inp[1] = !Inp[1];
    end
    if (i % 8 == 0) begin
      Inp[2] = !Inp[2];
    end
    if (i % 16 == 0) begin
      Inp[3] = !Inp[3];
    end
    #5;
  end
    
  $finish;  //fin simulacion

end
endmodule
