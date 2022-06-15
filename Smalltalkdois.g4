grammar Smalltalkdois;

init: (expressao | seentao | declaracao | atribuicao | loops | input | print)+;

comandos: (expressao | seentao | declaracao | atribuicao | loops | input | print)+;

seentao: 'se (' {System.out.print("if ( ");} condicao ') então {' {System.out.print(") {\n");} expressao '}' {System.out.print("}\n");} anticondicao;

condicao: varTypes operador varTypes;

anticondicao: 'ou senão {' {System.out.print("else {\n");} comandos '}' {System.out.print("}\n");} | ;

atribuicao: id 'recebe o valor ' {System.out.print(" = ");} varTypes {System.out.print("\n");};

declaracao: 'declare' id 'como' vartype {System.out.print("\n");};

expressao: (seentao | atribuicao | comentario)+;

loops: (while | for);

while: 'Enquanto (' {System.out.print("while (");} condicao ') for verdade, repita {' {System.out.print(") {\n ");} expressao '}' {System.out.print("}\n");};

for: 'Iniciando em (' atribuicao ') e iterando (' atribuicao ') enquanto (' condicao ') for verdade, repita {' expressao '}';

operador: 'é maior que' {System.out.print(" > ");} | 'é menor que' {System.out.print(" < ");} | 'é maior ou igual que' {System.out.print(" >= ");} | 'é menor ou igual que' {System.out.print(" <= ");} | 'é igual a' {System.out.print(" == ");} | 'é diferente de' {System.out.print(" != ");};

vartype: 'booleano' {System.out.print("bool");} | 'numero' {System.out.print("int");} | 'texto' {System.out.print("string");};

varTypes: (id|num|texto|booleano);

booleano: 'verdade'|'mentira';

input: 'leia (' varTypes ')';

print: 'imprima (' varTypes ')';

id: ID {System.out.print($ID.text);};

ID: [A-Za-z]+;

texto: TEXTO {System.out.print($TEXTO.text);}; 

TEXTO: [A-Za-z]+;

numero: NUMERO {System.out.print($NUMERO.text);};

num: NUMERO {System.out.print($NUMERO.text);};

NUMERO: [0-9]+;

comentario: {System.out.print("//");} COMENTARIO {System.out.print($COMENTARIO.text);} {System.out.print("\n");};

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