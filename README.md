# Determinantes

Programa escrito originalmente em Pascal para calcular determinantes de matrizes com ordem maior do que 3, utilizando o **Teorema de Laplace**.

## Instruções

### Crie uma branch

    git branch nome-do-branch

    git checkout nome-do-branch

### Envie as modificações

    git add .

    git commit -m "resume as alterações"

    git push origin nome-do-branch

## Utilizando a regra de Laplace

Considere:

3 | 1 | 0 | 1
--- | --- | --- | ---
**0** | **-1** | **3** | **4**
**1** | **1** | **0** | **2**
**0** | **1** | **1** | **-1**

Escolha uma linha ou coluna:

    [3, 1, 0, 1]

Faça a somatória do produto de cada elemento pelo seu cofator **a<sub>ij</sub> * A<sub>ij</sub>** sendo **a<sub>ij</sub>** o elemento da matriz e **A<sub>ij</sub>** o cofator de um elemento **a<sub>ij</sub>**:

**(3 * A<sub>11</sub>) + (1 * A<sub>12</sub>) + (0 * A<sub>13</sub>) + (1 * A<sub>14</sub>)**

Calcule o cofator pela mutliplicação da exponenciação e do menor complementar **(-1)<sup>i+j</sup> * D<sub>ij</sub>** sendo **D<sub>ij</sub>** o determinante da matriz resultante da eliminação da linha *i* e da coluna *j*:

**A<sub>11</sub> = (-1)<sup>i+j</sup> * D<sub>ij</sub>  
A<sub>11</sub> = (-1)<sup>1+1</sup> * D<sub>ij</sub>  
A<sub>11</sub> = (-1)<sup>2</sup> * D<sub>ij</sub>  
A<sub>11</sub> = 1 * D<sub>ij</sub>**

Calcule o menor complementar. Elimine as filas **ij** da matriz e deixe o que sobrou:

    D11 = [-1, 3, 4
            1, 0, 2
            1, 1, -1]

    ...

Para calcular o determinante do menor complementar é necessário utilizar Laplace em cada uma das matrizes até dar uma matriz 1x1. Lembre-se que estamos resolvendo aqui:

**(3 * A<sub>11</sub>) + (1 * A<sub>12</sub>) + (0 * A<sub>13</sub>) + (1 * A<sub>14</sub>)**

Isso é o suficiente para resolver o determinante da matriz proposta.

Nesse caso, a resposta deve ser 34.
