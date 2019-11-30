program laplace;

uses math, crt;

const max = 4;

type minhaMatriz = array[1..max, 1..max] of Integer;

var
  Matriz : minhaMatriz;
  primeiraLinha , expoente, sarrus, cofator: array[1..max] of integer;
  linha, coluna, determinante, resultante : integer;
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
                if linhaVelha <> linha then
                  Inc(linhaNova);
                if colunaNova <> coluna then
                  Inc(colunaNova);
                if linhaNova = tamanho then
                    linhaNova := 1;
                if colunaNova = tamanho then
                    colunaNova := 1;
                Write('[', linhaNova, ', ', colunaNova, ']')
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

  WriteLn('Eis aqui a sua Matriz: ');
  for linha := 1 to max do
    begin
      for coluna := 1 to max do
        write(matriz[linha, coluna]:3);
        WriteLn;
    end;

  { 2-3. Pegar valores da primeira linha e cria os valores de exponenciação }
  for linha := 1 to max do
    begin
      primeiraLinha[linha] := Matriz[1, linha];
      expoente[linha] := Round(Power(-1, linha + 1));
    end;

  resultante := determinar(Matriz, max);
  WriteLn(resultante);

  { 4-5. Pegar valores e calcular Sarrus }
  sarrus[1] := ((Matriz[2,2] * Matriz[3,3] * Matriz[4,4])  +
                (Matriz[2,3] * Matriz[3,4] * Matriz[4,2])  +
                (Matriz[2,4] * Matriz[3,2] * Matriz[4,3])) -

               ((Matriz[2,4] * Matriz[3,3] * Matriz[4,2])  +
                (Matriz[2,2] * Matriz[3,4] * Matriz[4,3])  +
                (Matriz[2,3] * Matriz[3,2] * Matriz[4,4])) ;

  sarrus[2] := ((Matriz[2,1] * Matriz[3,3] * Matriz[4,4])  +
                (Matriz[2,3] * Matriz[3,4] * Matriz[4,1])  +
                (Matriz[2,4] * Matriz[3,1] * Matriz[4,3])) -

               ((Matriz[2,4] * Matriz[3,3] * Matriz[4,1])  +
                (Matriz[2,1] * Matriz[3,4] * Matriz[4,3])  +
                (Matriz[2,3] * Matriz[3,1] * Matriz[4,4])) ;

  sarrus[3] := ((Matriz[2,1] * Matriz[3,2] * Matriz[4,4])  +
                (Matriz[2,2] * Matriz[3,4] * Matriz[4,1])  +
                (Matriz[2,4] * Matriz[3,1] * Matriz[4,2])) -

               ((Matriz[2,4] * Matriz[3,2] * Matriz[4,1])  +
                (Matriz[2,1] * Matriz[3,4] * Matriz[4,2])  +
                (Matriz[2,2] * Matriz[3,1] * Matriz[4,4])) ;

  sarrus[4] := ((Matriz[2,1] * Matriz[3,2] * Matriz[4,3])  +
                (Matriz[2,2] * Matriz[3,3] * Matriz[4,1])  +
                (Matriz[2,3] * Matriz[3,1] * Matriz[4,2])) -

               ((Matriz[2,3] * Matriz[3,2] * Matriz[4,1])  +
                (Matriz[2,1] * Matriz[3,3] * Matriz[4,2])  +
                (Matriz[2,2] * Matriz[3,1] * Matriz[4,3])) ;

  { 6. Calcular o cofator }
  cofator[1] := expoente[1] * sarrus[1];
  cofator[2] := expoente[2] * sarrus[2];
  cofator[3] := expoente[3] * sarrus[3];
  cofator[4] := expoente[4] * sarrus[4];

  { 7-8. Calcular o determinante }
  determinante := (primeiraLinha[1] * cofator[1]) +
                  (primeiraLinha[2] * cofator[2]) +
                  (primeiraLinha[3] * cofator[3]) +
                  (primeiraLinha[4] * cofator[4]);

  { 9. Mostrar o determinante }
  writeln('Determinante: ', determinante);
end.
