program laplace;
uses math;

const
    max = 4;

var
    mat : array[1..max, 1..max] of integer;
    firstLine , exponenciation, sarrus, cofactor: array[1..max] of integer;
    line, column, det : integer;

begin
    { 1. Criar a Matriz }
    writeln('Type the 4x4 matrix!');
    for line := 1 to max do
        for column := 1 to max do
            begin
                write('[', line, column, ']: ');
                readln(mat[line, column])
            end;

    { 2. Pegar valores da primeira linha }
    for line := 1 to max do
        firstLine[line] := mat[1, line];

    { 3. Criar os valores da exponenciação da primeira linha }
    for line := 1 to max do
        exponenciation[line] := Round(Power(-1, line + 1));

    { 4-5. Pegar valores e calcular Sarrus }
    sarrus[1] := ((mat[2,2] * mat[3,3] * mat[4,4])  + 
                  (mat[2,3] * mat[3,4] * mat[4,2])  + 
                  (mat[2,4] * mat[3,2] * mat[4,3])) - 

                 ((mat[2,4] * mat[3,3] * mat[4,2])  + 
                  (mat[2,2] * mat[3,4] * mat[4,3])  + 
                  (mat[2,3] * mat[3,2] * mat[4,4])) ;

    sarrus[2] := ((mat[2,1] * mat[3,3] * mat[4,4])  + 
                  (mat[2,3] * mat[3,4] * mat[4,1])  + 
                  (mat[2,4] * mat[3,1] * mat[4,3])) - 

                 ((mat[2,4] * mat[3,3] * mat[4,1])  + 
                  (mat[2,1] * mat[3,4] * mat[4,3])  + 
                  (mat[2,3] * mat[3,1] * mat[4,4])) ;

    sarrus[3] := ((mat[2,1] * mat[3,2] * mat[4,4])  + 
                  (mat[2,2] * mat[3,4] * mat[4,1])  + 
                  (mat[2,4] * mat[3,1] * mat[4,2])) - 

                 ((mat[2,4] * mat[3,2] * mat[4,1])  + 
                  (mat[2,1] * mat[3,4] * mat[4,2])  + 
                  (mat[2,2] * mat[3,1] * mat[4,4])) ;

    sarrus[4] := ((mat[2,1] * mat[3,2] * mat[4,3])  + 
                  (mat[2,2] * mat[3,3] * mat[4,1])  + 
                  (mat[2,3] * mat[3,1] * mat[4,2])) - 

                 ((mat[2,3] * mat[3,2] * mat[4,1])  + 
                  (mat[2,1] * mat[3,3] * mat[4,2])  + 
                  (mat[2,2] * mat[3,1] * mat[4,3])) ;

    { 6. Calcular o cofator }
    cofactor[1] := exponenciation[1] * sarrus[1];
    cofactor[2] := exponenciation[2] * sarrus[2];
    cofactor[3] := exponenciation[3] * sarrus[3];
    cofactor[4] := exponenciation[4] * sarrus[4];

    { 7-8. Calcular o determinante }
    det := (firstLine[1] * cofactor[1]) + 
           (firstLine[2] * cofactor[2]) + 
           (firstLine[3] * cofactor[3]) + 
           (firstLine[4] * cofactor[4]);

    { 9. Mostrar o determinante }
    writeln('Determinant: ', det);
end.
