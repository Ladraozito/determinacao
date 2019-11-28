program laplace;
uses math;

var
    matrix : array[1..4, 1..4] of integer;
    firstLine, exponentiation : array[1..4] of integer;
    line, column : integer;
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

end.