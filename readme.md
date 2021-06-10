GERAÇÃO DE ESPIRAL BASEADA NA ESPIRAL EQUIANGULAR
  Este trabalho tem por finalidade gerar - através de parâmetros pré estabelecidos e que devem ser informados pelo usuário - uma espiral baseada na espiral equiangular, conhecida também como a espiral do caracol, pois sua forma está presente nas concha dos moluscos. Sobre os parâmetros a serem informados:

  - Número de formas presentes no espiral: primeiro valor a ser informado, para melhor visualização, é preferível a utilização de valores no intervalo 10-200, mas nada impede que outros valores também possam ser utilizados.
  - Largura da imagem: largura do svg geral
  - Altura da imagem: altura do svg geral
  - Paleta de cores: escala de cores rgb a serem apresentadas na espiral, os valores informados podem ser:
    - grey, green, purple, pink, blue, yellow e red
    - em caso de não informação de uma das cores acima, por definição fica padronizado a escala de cores em cinza (grey)
  - Tamanho das formas representadas no espiral: podem ser s (small) m (medium) ou l (large), os tamanhos, são baseados na divisão da largura do svg por uma constante escolhida para representar cada uma das opões.
  - Escolha do formato utilizado na espiral: a espiral pode ser formada por circulos ou quadrados, por definição, caso o usuário não informe, ou informe uma forma que não esteja nas opções, a espiral será gerada com circulos.

- GERAÇÃO DA ESPIRAL: a geração da espiral é feita com base na fórmula matemática
          x(m) = r.m.cos(m)
          y(m) = r.m.sin(m)
          por definição matemática, quando ângulo chega a 90º, é gerado a forma espiral
  a fórmula foi modificada de modo que o m em questão é dividido por uma constante, para que por questões estéticas, gerasse um círculo em espiral, pois se analisado, a fórmula original leva a uma espiral com voltas mais "abertas", além disso, o valor resultande da fórmula é somado a um valor que representa o centro da imagem a partir da largura e altura definidas para o usuário, para que assim a espiral pudesse crescer centralizada.

- REFERÊNCIAS SOBRE A ESPIRAL EQUIANGULAR:
     
     http://www.mat.uc.pt/~picado/conchas/eng/espiraleng.html

     http://gazeta.spm.pt/getArtigo?gid=158

