program laplace;
uses math;

const
    max = 4;

var
    Matriz : array[1..max, 1..max] of integer;
    primeiraLinha , expoente, sarrus, cofator: array[1..max] of integer;
    linha, coluna, determinante : integer;

begin
    { 1. Criar a Matriz }
    writeln('Digite a Matriz 4x4!');
    for linha := 1 to max do
        for coluna := 1 to max do
            begin
                write('[', linha, coluna, ']: ');
                readln(Matriz[linha, coluna])
            end;

    { 2. Pegar valores da primeira linha }
    for linha := 1 to max do
        primeiraLinha[linha] := Matriz[1, linha];

    { 3. Criar os valores da exponenciação da primeira linha }
    for linha := 1 to max do
        expoente[linha] := Round(Power(-1, linha + 1));

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
