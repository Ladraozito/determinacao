program laplace;

uses math, crt;

const max = 5;

type minhaMatriz = array[1..max, 1..max] of Integer;

var
  Matriz : minhaMatriz;
  linha, coluna, determinante : integer;
  resposta : Char;

function determinar(matriz : minhaMatriz; tamanho : Integer): integer; forward;

function menorComplementar(matriz: minhaMatriz; linha, coluna, tamanho: integer): minhaMatriz;
  var
    novaMatriz: minhaMatriz;
    linhaVelha, colunaVelha, linhaNova, colunaNova: Integer;
  begin
    linhaNova := 1;
    colunaNova := 1;
    for linhaVelha := 1 to tamanho do
      begin
        for colunaVelha := 1 to tamanho do
          begin
            if (linhaVelha <> linha) and (colunaVelha <> coluna) then
              begin
                novaMatriz[linhaNova, colunaNova] := matriz[linhaVelha, colunaVelha];
                Inc(colunaNova);
                if colunaNova = tamanho then
                  begin
                    colunaNova := 1;
                    Inc(linhaNova)
                  end;
              end
          end;
      end;
    menorComplementar := novaMatriz;
  end;

function cofatorar(matriz : minhaMatriz; linha, coluna, tamanho: Integer): Integer;
  begin
    cofatorar := Round(Power(-1, linha + coluna)) * determinar(menorComplementar(matriz, linha, coluna, tamanho), tamanho-1);
  end;

function determinar(matriz : minhaMatriz; tamanho : Integer): integer;
  var
    coluna, resultado, cofatorado : Integer;
  begin
    if tamanho = 1 then
      determinar := matriz[1, 1]
    else
      begin
        resultado := 0;
        for coluna := 1 to tamanho do
          begin
            cofatorado := cofatorar(matriz, 1, coluna, tamanho);
            resultado := resultado + (matriz[1][coluna] * cofatorado)
          end;
        determinar := resultado
      end;
  end;

begin
  { 1. Criar a Matriz }
  Write('Deseja inserir os numeros da Matriz? [S/N]: ');
  ReadLn(resposta);

  if resposta in ['S', 's'] then
    begin
      writeln('Digite a Matriz 4x4!');
      for linha := 1 to max do
        for coluna := 1 to max do
          begin
            write('[', linha, coluna, ']: ');
            readln(Matriz[linha, coluna])
          end;
    end
  else
    begin
      randomize;
      for linha := 1 to Max do
        for coluna := 1 to max do
          matriz[linha, coluna] := Random(10);
    end;

  clrscr;
  WriteLn('Eis aqui a sua Matriz: ');
  for linha := 1 to max do
    begin
      for coluna := 1 to max do
        write(matriz[linha, coluna]:3);
        WriteLn;
    end;

  determinante := determinar(Matriz, max);
  writeln('Determinante: ', determinante);
end.
