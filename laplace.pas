program laplace;
uses math;

var
    matrix : array[1..4, 1..4] of integer;
    firstLine, exponentiation, cofactor : array[1..4] of integer;
    line, column, det : integer;
begin
    { Create the matrix }
    for line := 1 to 4 do
        for column := 1 to 4 do
            begin
                write('[', line, column, ']: ');
                readln(matrix[line, column])
            end;

    { Get the values of the first line }
    for line := 1 to 4 do
        firstLine[line] := matrix[1, line];

    { Create the values of the exponenciation of the first line }
    for line := 1 to 4 do
        exponentiation[line] := Round(Power(-1, line + 1));

    { Calculate the cofactor }
    cofactor[1] := exponentiation[1] * (((matrix[2,2] * matrix[3,3] * matrix[4,4]) + (matrix[2,3] * matrix[3,4] * matrix[4,2]) + (matrix[2,4] * matrix[3,2] * matrix[4,3])) - 
                                       ((matrix[2,4] * matrix[3,3] * matrix[4,2]) + (matrix[2,2] * matrix[3,4] * matrix[4,3]) + (matrix[2,3] * matrix[3,2] * matrix[4,4])));

    cofactor[2] := exponentiation[2] * (((matrix[2,1] * matrix[3,3] * matrix[4,4]) + (matrix[2,3] * matrix[3,4] * matrix[4,1]) + (matrix[2,4] * matrix[3,1] * matrix[4,3])) - 
                                       ((matrix[2,4] * matrix[3,3] * matrix[4,1]) + (matrix[2,1] * matrix[3,4] * matrix[4,3]) + (matrix[2,3] * matrix[3,1] * matrix[4,4])));

    cofactor[3] := exponentiation[3] * (((matrix[2,1] * matrix[3,2] * matrix[4,4]) + (matrix[2,2] * matrix[3,4] * matrix[4,1]) + (matrix[2,4] * matrix[3,1] * matrix[4,2])) - 
                                       ((matrix[2,4] * matrix[3,2] * matrix[4,1]) + (matrix[2,1] * matrix[3,4] * matrix[4,2]) + (matrix[2,2] * matrix[3,1] * matrix[4,4])));

    cofactor[4] := exponentiation[4] * (((matrix[2,1] * matrix[3,2] * matrix[4,3]) + (matrix[2,2] * matrix[3,3] * matrix[4,1]) + (matrix[2,3] * matrix[3,1] * matrix[4,2])) - 
                                       ((matrix[2,3] * matrix[3,2] * matrix[4,1]) + (matrix[2,1] * matrix[3,3] * matrix[4,2]) + (matrix[2,2] * matrix[3,1] * matrix[4,3])));

    { Calculate de determinant }
    det := (firstLine[1] * cofactor[1]) + 
          (firstLine[2] * cofactor[2]) + 
          (firstLine[3] * cofactor[3]) + 
          (firstLine[4] * cofactor[4]);

    writeln('Determinant: ', det)
end.