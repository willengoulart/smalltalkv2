grammar Smalltalkdois;

init: {System.out.println("import java.util.Scanner;");
    System.out.println("public class Code{");
	System.out.println("public static void main(String[] args){");}
	comandos
	{System.out.println("}}");};

comandos: (expressao | seentao | declaracao | atribuicao | loops | input | print)+;

seentao: 'se (' {System.out.print("if ( ");} condicao ') então {' {System.out.print(") {\n");} expressao '}' {System.out.print("}\n");} anticondicao;

condicao: varTypes operador varTypes;

anticondicao: 'ou senão {' {System.out.print("else {\n");} comandos '}' {System.out.print("}\n");} | ;

atribuicao: id 'recebe o valor ' {System.out.print(" = ");} varTypes {System.out.print(";\n");};

declaracao: 'declare' vartype 'como' id {System.out.print(";\n");};

expressao: (seentao | atribuicao | comentario)+;

loops: (while | for);

while: 'Enquanto (' {System.out.print("while (");} condicao ') for verdade, repita {' {System.out.print(") {\n ");} expressao '}' {System.out.print("}\n");};

foratribuicao: id 'recebe o valor ' {System.out.print(" = ");} varTypes;

for: 'Iniciando em (' {System.out.print("for (");} atribuicao ') enquanto (' condicao {System.out.print(";");}') for verdade e iterando (' foratribuicao {System.out.print(") {");}'), repita {' expressao '}'{System.out.print("}");};

operador: 'é maior que' {System.out.print(" > ");} | 'é menor que' {System.out.print(" < ");} | 'é maior ou igual que' {System.out.print(" >= ");} | 'é menor ou igual que' {System.out.print(" <= ");} | 'é igual a' {System.out.print(" == ");} | 'é diferente de' {System.out.print(" != ");};

vartype: 'booleano' {System.out.print("boolean ");} | 'numero' {System.out.print("int ");} | 'texto' {System.out.print("String ");};

varTypes: (id|num|texto|booleano);

booleano: 'verdade' {System.out.print("true");}| 'mentira' {System.out.print("false");};

input: 'leia (' varTypes {System.out.print(" = new Scanner(System.in).nextLine()");} {System.out.print(";\n");}')';

print: 'imprima (' {System.out.print("System.out.println(");} varTypes {System.out.print(");\n");}')';

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