grammar Smalltalkdois;

init: (expressao | seentao | declaracao | atribuicao | loops | input | print)+;

comandos: (expressao | seentao | declaracao | atribuicao | loops | input | print)+;

seentao: 'se (' condicao ') então {' expressao '}' anticondicao;

condicao: varTypes operador varTypes;

anticondicao: 'ou senão {' comandos '}' | ;

atribuicao: id 'recebe o valor ' varTypes;

declaracao: 'declare' id 'como' vartype;

expressao: (seentao | atribuicao | comentario)+;

loops: (while | for);

while: 'Enquanto (' condicao ') for verdade, repita {' expressao '}';

for: 'Iniciando em (' atribuicao ') e iterando (' atribuicao ') enquanto (' condicao ') for verdade, repita {' expressao '}';

operador: 'é maior que' | 'é menor que' | 'é maior ou igual que' | 'é menor ou igual que' | 'é igual a' | 'é diferente de';

vartype: 'booleano' | 'numero' | 'texto';

varTypes: (id|num|texto|booleano);

booleano: 'verdade'|'mentira';

input: 'leia (' varTypes ')';

print: 'imprima (' varTypes ')';

id: ID;

ID: [A-Za-z]+;

texto: TEXTO;

TEXTO: [A-Za-z]+;

numero: NUMERO;

num: NUMERO;

NUMERO: [0-9]+;

comentario: COMENTARIO;

COMENTARIO: 'Comente que' .*? '.Comentário feito';

Ws: [ \t\r\n]+ -> skip;



/*


• A parte de expressões envolvendo os operadores matemáticos deve ser realizada de maneira
correta, respeitando a precedência. Não é necessário gerar a resposta da expressão, basta
cuidar da precedência entre os operadores matemáticos através da gramática;
[OK]As atribuições também devem ser realizadas;
– É necessário verificar se é possível realizar as operações, devido aos tipos das variáveis e ao seu
escopo.
• Os comandos de leitura do teclado (Scanner) e de impressão na tela (println) devem ser
disponibilizados.
• O compilador tem que aceitar números decimais.
• A cada utilização de uma variável, é necessário verificar se ela já foi declarada.


TODO:
- Fazer imprimir a anticondicao
- Fazer o comentário funcionar direito
- Fazer o texto funcionar com aspas - minhaString recebe o valor "ola amigo"


comentarioLinha: 'cmt ' comentario;

comentario: COMENTARIO;

COMENTARIO: [A-Za-z0-9]+;

*/