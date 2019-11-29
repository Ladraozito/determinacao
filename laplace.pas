program laplace;
uses math;


var
    mat : array[1..4, 1..4] of integer;
    
    firstLine : array[1..4] of integer;
    exponentiation : array[1..4] of integer;
    sarrus : array[1..4] of integer; 
    cofactor : array[1..4] of integer;

    line, column, det : integer;

begin
    { 1. Create the matrix }
    writeln('Type the 4x4 matrix!');
    for line := 1 to 4 do
        for column := 1 to 4 do
            begin
                write('[', line, column, ']: ');
                readln(mat[line, column])
            end;


    { 2. Get the values of the first line }
    for line := 1 to 4 do
        firstLine[line] := mat[1, line];


    { 3. Create the values of the exponenciation of the first line }
    for line := 1 to 4 do
        exponentiation[line] := Round(Power(-1, line + 1));


    { 4-5. Get the values and calculate Sarrus }
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


    { 6. Calculate the cofactor }
    cofactor[1] := exponentiation[1] * sarrus[1];
    cofactor[2] := exponentiation[2] * sarrus[2];
    cofactor[3] := exponentiation[3] * sarrus[3];
    cofactor[4] := exponentiation[4] * sarrus[4];


    { 7. 8. Calculate de determinant }
    det := (firstLine[1] * cofactor[1]) + 
           (firstLine[2] * cofactor[2]) + 
           (firstLine[3] * cofactor[3]) + 
           (firstLine[4] * cofactor[4]);

    { 9. Finally, show the determinant }
    writeln('Determinant: ', det);
end.
