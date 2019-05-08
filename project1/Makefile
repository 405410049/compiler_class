all:
	java -jar antlr-4.7.2-complete.jar myLexer.g
	javac -cp antlr-4.7.2-complete.jar myLexer.java testLexer.java
input1:
	java -cp antlr-4.7.2-complete.jar:. testLexer input.c
input2:
	java -cp antlr-4.7.2-complete.jar:. testLexer input2.c
input3:
	java -cp antlr-4.7.2-complete.jar:. testLexer input3.c
