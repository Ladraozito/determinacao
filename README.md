# determinacao
programas para calcular determinantes de matrizes com ordem maior do que 3.

## Instruções

### clonar o repositório
Para clonar o repositório use o comando `git clone https://github.com/Ladraozito/determinacao.git`, ele gerará uma pasta com os arquivos do repositório dentro.

Para entrar na pasta via terminal use `cd determinacao`.

### criar novo branch
`git branch nome-do-branch`

### mudar de branch
`git checkout nome-do-branch`

### enviar modificações
`git add .` para selecionar os arquivos para comitar.

`git commit -m "resume as alterações"` para comitar.

`git push origin nome-do-branch` para enviar os arquivos para o repositório remoto no GitHub.

## Extras

### receber modificações
Se precisar receber alguma modificação ou quiser ver as alterações de um branch, você pode alterar para o branch desejado e usar o comando `git push`.

### verificar situação
`git status`

### vareficar branchs locais
`git branch` mostra os seus branchs locais da máquina.

## Lazarus no Linux
Caso você esteja usando o Lazarus no Linux e não conseguir executar o programa tente seguir estes passos:

1. Verifique se na primeira do programa está escrito `{%RunCommand gnome-terminal -e $(TargetFile)}`
2. Clique em Executar
3. Clique em Executar arquivo

