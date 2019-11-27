program Plaplace;
uses crt;
  const
    MaxI = 5;
    MaxJ = 5;
  var
    Matr: array [1..MaxI,1..MaxJ] of integer;
    I, J, Ipergunt, numI: integer;
      {Ipergunt = pergunta qual linha o usuário quer "eliminar"}

begin
  numI:= 0;
  for I:= 1 to MaxI do
    begin
      for J:= 1 to MaxJ do
        begin
          Matr[I,J]:= random(MaxI * MaxJ);
          write(Matr[I,J],' ');
            if J = MaxJ then
              write(Matr[I,J],' |Linha .',numI);
        end;
      writeln;
      inc(numI);
    end;
  writeln;
  writeln('Escolha uma linha qualquer da matriz para comecar o calculo: ');
  writeln('Ex: "2" = Linha 2');
  readln(Ipergunt);
  clrscr;
  writeln('Voce escolheu a linha ', Ipergunt
  );
  readln;

end.

