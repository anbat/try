/*  1b. Write YACC program to evaluate arithmetic expression involving operators: +, -, *, and /
*/

%{
#include "y.tab.h"
#include <stdlib.h>
extern int yylval;
%}

%%
[0-9]+ {yylval=atoi(yytext);
	return NUM;}
\n {return 0;}
. {return yytext[0];}
%%


/*   OUTPUT

[root@localhost ss]# lex 1b.l
[root@localhost ss]# yacc -d 1b.y
[root@localhost ss]# cc lex.yy.c y.tab.c -ll
[root@localhost ss]# ./a.out
Enter arithmetic exression:
2+3*6
Result=20
expression is valid
[root@localhost ss]# ./a.out
Enter arithmetic exression:
2+3/0
Divide by zero error
[root@localhost ss]# ./a.out
Enter arithmetic exression:
(2*8)/2
Result=8
expression is valid
*/

