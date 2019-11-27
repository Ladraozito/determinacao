{%RunCommand gnome-terminal -e $(TargetFile)}
program Plaplace;
uses crt;
const
  Max = 5;
var
  Matriz: array[1..Max,1..Max] of integer;
  linha, coluna, escolhida, contador: integer;
begin
  contador:= 0;
  for linha:= 1 to Max do
    begin
      for coluna:= 1 to Max do
        begin
          Matriz[linha, coluna]:= random(Max * Max);
          write(Matriz[linha, coluna],' ');
            if coluna = Max then
              write(Matriz[linha, coluna],' |Linha ', contador);
        end;
      writeln;
      inc(contador);
    end;
  writeln;
  writeln('Escolha uma linha qualquer da matriz para comecar o calculo: ');
  writeln('Ex: "2" = Linha 2');
  readln(escolhida);
  clrscr;
  writeln('Voce escolheu a linha ', escolhida);
  readln;
end.

