def determinar(matriz):
    if len(matriz) == 1:
        return matriz[0][0]
    else:
        linha = matriz[0]
        resultado = 0
        for coluna in range(len(linha)):
            resultado += linha[coluna] * cofator(matriz, 0, coluna)
        return resultado


def cofator(matriz, linha, coluna):
    return (-1)**(linha + coluna) * determinar(complementar(matriz, linha, coluna))


def complementar(matriz, linha, coluna):
    tamanho = len(matriz)
    novaMatriz = [[None for j in range(tamanho-1)] for i in range(tamanho-1)]
    linhaNova = 0
    colunaNova = 0
    for linhaVelha in range(tamanho):
        for colunaVelha in range(tamanho):
            if (linhaVelha != linha) and (colunaVelha != coluna):
                novaMatriz[linhaNova][colunaNova] = matriz[linhaVelha][colunaVelha]
                colunaNova += 1
                if colunaNova == tamanho-1:
                    colunaNova = 0
                    linhaNova += 1
    return novaMatriz


matriz = [[3,  1, 0,  1],
          [0, -1, 3,  4],
          [1,  1, 0,  2],
          [0,  1, 1, -1]]

determinante = determinar(matriz)
print(determinante)
