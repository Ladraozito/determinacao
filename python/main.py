import os
import random


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


tamanho = input('Informe o tamanho da matriz: ')
while not tamanho.isdigit():
    tamanho = input('Informe o tamanho da matriz: ')
tamanho = int(tamanho)

matriz = [[None for j in range(tamanho)] for i in range(tamanho)]
largura = 0
escolha = input('Deseja digitar os elemento da matriz? [S/N]: ')
if escolha in 'Ss':
    print(f'Digite os elementos da matriz {tamanho}x{tamanho}:')
    for i in range(tamanho):
        for j in range(tamanho):
            while True:
                elemento = input(f'[{i+1}][{j+1}]: ')
                try:
                    int(elemento)
                except ValueError:
                    pass
                else:
                    break
            matriz[i][j] = int(elemento)
            if len(elemento) > largura:
                largura = len(elemento)
else:
    for linha in range(tamanho):
        for coluna in range(tamanho):
            matriz[linha][coluna] = random.randint(-10, 10)
            if len(str(matriz[linha][coluna])) > largura:
                largura = len(str(matriz[linha][coluna]))

os.system('cls' if os.name == 'nt' else 'clear')
print('Eis aqui a sua matriz:')

string = '['
for linha in range(tamanho):
    string += '['
    for coluna in range(tamanho):
        string += f'{str(matriz[linha][coluna]):>{largura}}'
        if coluna < tamanho-1:
            string += ' '
    if linha < tamanho-1:
        string += ']\n '
    else:
        string += ']'
string += ']'

print(string)
determinante = determinar(matriz)
print(f'Determinante: {determinante}')
