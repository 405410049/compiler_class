grammar myparser;
options{
	language=Java;
}
@members {
    boolean TRACEON = true;
}
prog:
	include* INT MAIN '(' ')' NEWLINE* '{' NEWLINE declarations stats '}'
        {if (TRACEON) System.out.println("prog: INT MAIN () {declarations statements}");};
include:
	'#include<' ID '.h>' NEWLINE
	{ if(TRACEON) System.out.println("incldue: include .h");};
//	declaration declarations
//	| SEPARATE NEWLINE;
	//	| { if (TRACEON) System.out.println("declaration: ");};
declarations:
	 type ID ('=' primaryExpr)* declarations
        { if (TRACEON) System.out.println("declarations: type Identifier;"); }
	|',' ID ('=' primaryExpr)* declarations
	|SEPARATE NEWLINE declarations*
	|COMMENT declarations
        {System.out.println("declarations: COMMENT");};
type:
	INT
	{ if (TRACEON) System.out.println("type: INT"); }
	|CHAR
	{ if (TRACEON) System.out.println("type: CHAR"); }
	|VOID
	{ if (TRACEON) System.out.println("type: VOID"); }
	|FLOAT
	{ if (TRACEON) System.out.println("type: FLOAT"); }
	|DOUBLE
	{ if (TRACEON) System.out.println("type: DOUBLE"); };
stats:stat stats | ;
stat:
    	ID '=' arith_expression SEPARATE NEWLINE
        {System.out.println("statement: ID = arith_expression");}
	|ID '(' STRING (',' ID)* ')' SEPARATE NEWLINE 
        {System.out.println("statement: printf()");}
	|ID '(' STRING (',' '&' ID)* ')' SEPARATE NEWLINE 
        {System.out.println("statement: scanf()");}
        |IF '(' arith_expression ')' NEWLINE* loop_stat 
        {System.out.println("statement: IF(arith_expression) loopstat");}
        |ELSE NEWLINE* loop_stat 
        {System.out.println("statement: ELSE loop_stat");}
	|WHILE '(' arith_expression ')' NEWLINE* loop_stat
        {System.out.println("statement: WHILE(arith_expression) while_stat");}
	|FOR '(' arith_expression SEPARATE arith_expression SEPARATE arith_expression ')' NEWLINE* loop_stat
        {System.out.println("statement: FOR(arith_expression) loop_stat");}
	|BREAK SEPARATE NEWLINE
        {System.out.println("statement: BREAK");}
	|COMMENT 
        {System.out.println("statement: COMMENT");};
loop_stat:
	stat NEWLINE* 
        {System.out.println("loop_stat: stat");}
	| '{' NEWLINE stats '}' NEWLINE
        {System.out.println("loop_stat: { stats }");};
arith_expression: 
	(multExpr| ARITH_OP* multExpr ARITH_OP*)*( '+' multExpr| '-' multExpr| '=' multExpr | COM_OP multExpr )*;
multExpr: 
	signExpr( '*' signExpr| '/' signExpr)*;
signExpr:
	primaryExpr
        |'-' primaryExpr;
primaryExpr: 
	DEC_NUM
        |FLOAT_NUM
        |ID
        |'(' arith_expression ')';

NEWLINE:'\r'? '\n' ;
WS  :   (' '|'\t')+ {skip();} ;
MAIN:'main';

// Data Type
INT:'int';
CHAR:'char';
VOID:'void';
FLOAT:'float';
DOUBLE:'double';

//Operators
COM_OP: '=='|'!='|'>'|'<'|'>='|'<=' ;
ARITH_OP: '++' | '--' ;
/*
EQ:'==';
NE:'!=';
GT:'>';
GE:'>=';
LE:'<=';
LT:'<';
*/

//Control-flow
IF:'if';
ELSE:'else';
WHILE:'while';
FOR:'for';
BREAK:'break';

//logical operator
AND:'&&';
NOT:'!';

//Sign
SEPARATE:';';

fragment LETTER:'a'..'z'|'A'..'Z'|'_';
fragment DIGIT:'0'..'9';
ID:(LETTER)(LETTER|DIGIT)*;
DEC_NUM:'-'(DIGIT)+|(DIGIT)+;
fragment FLOAT_NUM1:(DIGIT)+|'.'(DIGIT)*;
fragment FLOAT_NUM2:'.'(DIGIT)+;
FLOAT_NUM:FLOAT_NUM1|FLOAT_NUM2;

STRING:'"'(.)*?'"';
COMMENT:'//'(.)*?'\n';
