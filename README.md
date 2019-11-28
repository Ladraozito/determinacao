# Determinantes
Programa escrito em Pascal para calcular determinantes de matrizes com ordem maior do que 3, utilizando a regra de Laplace.

## Instruções

### Crie uma branch
    git branch nome-do-branch

    git checkout nome-do-branch

### Envie as modificações
    git add .

    git commit -m "resume as alterações"

    git push origin nome-do-branch

Quem sabe mais sobre Git, sabe, quem não sabe, não sabe.

Quem sabe executar Pascal no Linux, sabe, quem não sabe, não sabe.
:)

## Utilizando a regra de Laplace
Considere:

|||||
--- | --- | --- | ---
3 | 1 | 0 | 1
0 | -1 | 3 | 4
1 | 1 | 0 | 2
0 | 1 | 1 | -1


Escolha uma linha ou coluna: 
    
    [3, 1, 0, 1]

Multiplique e some cada elemento pelo seu cofator `ij * Cij`:
    
    (3 * C11) + (1 * C12) + (0 * C13) + (1 * C14)

Calcule o cofator pela mutliplicação da exponenciação e do menor complementar `Power(-1, i+j) * Dij`:

    C11 = Power(-1, i+j) * Dij
    C11 = Power(-1, 1+1) * D11
    C11 = Power(-1, 2) * D11
    C11 = 1 * D11

    ...

Calcule o menor complementar. Elimine as filas `ij` da matriz e deixe o que sobrou:

    D11 = [-1, 3, 4
            1, 0, 2
            1, 1, -1]

    ...

Agora é necessário aplicar a regra de `Sarrus`, duplicando as duas primeiras colunas e multiplicando daquele jeitinho lá :)

     D11 = | -1, 3,  4 | -1 3
           |  1, 0,  2 |  1 0
           |  1, 1, -1 |  1 1

    D11 = (0 + 6 + 4) - (0 - 2 - 3)
    D11 = 10 - (-5)
    D11 = 15

    ...

Lembre-se que estamos resolvendo aqui:

    (3 * C11) + (1 * C12) + (0 * C13) + (1 * C14)
    
Isso é o suficiente para resolver o determinante da matriz proposta.

Nesse caso, a resposta deve ser 34.
