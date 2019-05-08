lexer grammar myLexer;

options {
  language = Java;
}

// Data Type
INT:'int';
CHAR:'char';
VOID:'void';
FLOAT:'float';
DOUBLE:'double';

//Operators
ASSIGN:'=';
EQ:'==';
NE:'!=';
GT:'>';
GE:'>=';
LE:'<=';
LT:'<';
ADD:'+';
ADD2:'++';
ADD3:'+=';
SUB:'-';
SUB2:'--';
SUB3:'-=';
MUL:'*';
MUL2:'*=';

//logical operator
AND:'&&';
NOT:'!';
OR:'||';


//Sign
SEMICOLON:';';
COMMA:',';
L_BRACE:'{';
R_BRACE:'}';
L_PARENTHESES:'(';
R_PARENTHESES:')';
ADDR_SIGN:'&';

//Control-flow
IF:'if';
ELSE:'else';
WHILE:'while';
FOR:'for';

fragment LETTER:'a'..'z'|'A'..'Z'|'_';
fragment DIGIT:'0'..'9';

DEC_NUM:'-'(DIGIT)+|(DIGIT)+;	
ID:(LETTER)(LETTER|DIGIT)*;

fragment FLOAT_NUM1:(DIGIT)+|'.'(DIGIT)*;
fragment FLOAT_NUM2:'.'(DIGIT)+;
FLOAT_NUM:FLOAT_NUM1|FLOAT_NUM2;

NEW_LINE:'\n';

WS:(' '|'\t'|'\r')+;

RETURN:'return';
//Comment
COMMENT:'//'(.)*?'\n';
STRING:'"'(.)*?'"';
