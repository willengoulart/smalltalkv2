#! /bin/bash
export CLASSPATH=".:/home/willen/Documentos/pessoais/facul/compila/smalltalkv2/antlr-4.10.1-complete.jar:$CLASSPATH"
java org.antlr.v4.Tool Smalltalkdois.g4
javac *.java
java org.antlr.v4.gui.TestRig Smalltalkdois init < meuPrograma.sm2
# java org.antlr.v4.gui.TestRig Smalltalkdois init -gui < meuPrograma.sm2
# java Main < meuPrograma.sm2 