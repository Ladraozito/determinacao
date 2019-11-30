program laplace;

uses math, crt;

type minhaMatriz = array of array of Integer;

var
  Matriz : minhaMatriz;
  linha, coluna, determinante, max: integer;
  resposta : Char;

function determinar(matriz : minhaMatriz; tamanho : Integer): integer; forward;

function menorComplementar(matriz: minhaMatriz; linha, coluna, tamanho: integer): minhaMatriz;
  var
    novaMatriz: minhaMatriz;
    linhaVelha, colunaVelha, linhaNova, colunaNova: Integer;
  begin
    SetLength(novaMatriz, tamanho + 1);
    for linhaNova := 0 to tamanho + 1 do
      SetLength(novaMatriz[linhaNova], tamanho+1);
    linhaNova := 0;
    colunaNova := 0;
    for linhaVelha := 0 to tamanho do
      begin
        for colunaVelha := 0 to tamanho do
          begin
            if (linhaVelha <> linha) and (colunaVelha <> coluna) then
              begin
                novaMatriz[linhaNova, colunaNova] := matriz[linhaVelha, colunaVelha];
                Inc(colunaNova);
                if colunaNova = tamanho then
                  begin
                    colunaNova := 0;
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
    if tamanho = 0 then
      determinar := matriz[0, 0]
    else
      begin
        resultado := 0;
        for coluna := 0 to tamanho do
          begin
            cofatorado := cofatorar(matriz, 0, coluna, tamanho);
            resultado := resultado + (matriz[0][coluna] * cofatorado)
          end;
        determinar := resultado
      end;
  end;

begin
  Write('Qual a ordem da Matriz? ');
  ReadLn(Max);
  SetLength(Matriz, max);
  for linha := 0 to max-1 do
    SetLength(Matriz[linha], max);
  max := max-1;

  Write('Deseja inserir os numeros da Matriz? [S/N]: ');
  ReadLn(resposta);

  if resposta in ['S', 's'] then
    begin
      writeln('Digite a Matriz de ordem ', max);
      for linha := 0 to max do
        for coluna := 0 to max do
          begin
            write('[', linha+1, ', ', coluna+1, ']: ');
            readln(Matriz[linha, coluna])
          end;
    end
  else
    begin
      randomize;
      for linha := 0 to Max do
        for coluna := 0 to max do
          matriz[linha, coluna] := Random(10);
    end;

  clrscr;
  WriteLn('Eis aqui a sua Matriz: ');

  WriteLn;
  for linha := 0 to max do
    begin
      for coluna := 0 to max do
        write(matriz[linha, coluna]:3);
        WriteLn;
    end;
  WriteLn;

  determinante := determinar(Matriz, max);
  writeln('Determinante: ', determinante);
  readln;
end.
