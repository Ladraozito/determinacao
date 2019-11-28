{%RunCommand gnome-terminal -e $(TargetFile)}
program laplace;
uses crt;
const
  Max = 4;
var
  Matr: array [1..Max,1..Max] of integer;
  I, J, Ipergunt, numI: integer;
begin
  numI:= 0;
  for I:= 1 to Max do
    begin
      for J:= 1 to Max do
        begin
          Matr[I,J]:= random(Max * Max);
          write(Matr[I,J],' ');
          if J = Max then
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
  writeln('Voce escolheu a linha ', Ipergunt);
  readln;
end.

