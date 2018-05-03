/*  1    a. Write a LEX program to recognize valid arithmetic expression. Identifiers in the expression
could be only integers and operators could be + and *. Count the identifiers & operators present and
print them separately.
*/

%{
#include<stdio.h>
#include<string.h>
int nooper=0,nooperand=0,top=0,i=0,j=0,tnooper=0,tnoopnd=0,valid=0;
char opnd[10][10],opert[10][10];
%}
%%
"(" { valid =1;}
")" { valid=0;}
"+"|"*" {nooper++; strcpy(opert[i],yytext);i++;}
[0-9]+ {nooperand++; strcpy(opnd[j],yytext);j++;}
[^+*]"("[^0-9]   YYFAIL();
%%

int main()
{
	int k;
	printf("enter the expression\n");
	yylex();
	if(valid==0 &&(nooperand-nooper)==1)
	{
		printf("the exp is valid\n");
		printf("the operator are\n");
		for(k=0;k<i;k++)
		printf("%s\n",opert[k]);
		printf("the operands are\n");
		for(k=0;k<j;k++)
		printf("%s\n",opnd[k]);
	}
	else{
		printf("the exp is invalid");
		return 0;
	     }
}

int YYFAIL()
{ 
	printf("Invalid");
	exit(0);
}



/*  OUTPUT

[root@localhost ss]# lex 1a.l
[root@localhost ss]# cc lex.yy.c -ll
[root@localhost ss]# ./a.out 
enter the expression
2+3*4

the exp is valid
the operator are
+
*
the operands are
2
3
4
[root@localhost ss]# ./a.out 
enter the expression
(2+3)()
Invalid[root@localhost ss]# ./a.out 
enter the expression
(2+3)*()

the exp is invalid[root@localhost ss]# ./a.out 
enter the expression
((2+3)*(4+5))

the exp is valid
the operator are
+
*
+
the operands are
2
3
4
5
*/
