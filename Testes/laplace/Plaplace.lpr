{%RunCommand gnome-terminal -e $(TargetFile)}
program Plaplace;
uses crt;
  const
    Max = 5;
  var
    Matriz: array[1..Max,1..Max] of integer;
    I, J, Ipergunt, numI: integer;
    {Ipergunt = pergunta qual linha o usuário quer "eliminar"}
begin
  numI:= 0;
  for I:= 1 to Max do
    begin
      for J:= 1 to Max do
        begin
          Matriz[I,J]:= random(Max * Max);
          write(Matriz[I,J],' ');
            if J = Max then
              write(Matriz[I,J],' |Linha .',numI);
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

