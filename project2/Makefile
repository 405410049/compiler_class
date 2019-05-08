all:
	java -jar antlr-4.7.2-complete.jar myparser.g
	javac -cp antlr-4.7.2-complete.jar  myparserLexer.java myparserParser.java testParser.java myparserListener.java myparserBaseListener.java 
input1:
	 java -cp antlr-4.7.2-complete.jar:. testParser input1.c
input2:
	 java -cp antlr-4.7.2-complete.jar:. testParser input2.c
input3:
	 java -cp antlr-4.7.2-complete.jar:. testParser input3.c

