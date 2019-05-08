I crate the  myparser.g that defines the tokens of C program subsets.
Then I use the antlr4 to generate the related files.
After generating the file that I need , I write the testParser.java in order to call my parser.
And I use the command that is "javac -cp antlr-4.7.2-complete.jar  myparserLexer.java myparserParser.java testParser.java myparserListener.java myparserBaseListener.java" to compile the files. 
In the end , we need to use the command that is "java -cp antlr-4.7.2-complete.jar:. testParserer test_program.c" to execute the program.

About Makefile
Use command "make" to compile the files.
Command "make input" is execute the parser to input.c
Command "make input2" is execute the parser analyze to input2.c
Command "make input3" is execute the parser analyze to input3.c

