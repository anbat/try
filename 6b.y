/*  6b) Write YACC program to recognize valid identifier, operators and keywords in the given text (C
program) file.
*/

%{
 #include <stdio.h>
 #include <stdlib.h>
 int id=0, key=0, op=0;
 %}

%token ID KEY OP 
%%
input: ID input { id++; }
 | KEY input { key++; }
 | OP input {op++;}
 | ID { id++; }
 | KEY { key++; }
 | OP { op++;}
 ;
 %%
 
extern FILE *yyin;
 
void main(int argc ,char** argv) 
{
	yyin = fopen(argv[1],"r");
	yyparse();
	printf("Keywords = %d\nIdentifiers = %d\noperators = %d\n", key,id, op);
}

void yyerror()
{
	printf("Not valid");
}

/*  OUTPUT

[root@localhost ss]# lex 6b.l
[root@localhost ss]# yacc -d 6b.y
[root@localhost ss]# cc lex.yy.c y.tab.c -ll
[root@localhost ss]# ./a.out 6bin.c
keyword is void
keyword is main


keyword is int
identifier is a
identifier is b
identifier is c

identifier is p
operator is =
identifier is q
operator is +
identifier is r

identifier is m
operator is =
identifier is k
operator is +
identifier is t


Keywords = 3
Identifiers = 9
operators = 4

*/
