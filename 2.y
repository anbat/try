%{
#include <stdio.h>
int aCount=0,n;
%}
%token A
%token B
%%
s : X B {   if (aCount<n || aCount>n) 
	    {
             YYFAIL();
            }
        }
X : X T | T
T : A { aCount++;} 
  ;
%%

int main()
{	printf("Enter the value of n \n");
        scanf("%d",&n);
	printf("Enter the string\n");
	yyparse();
	printf("Valid string\n");
}

int YYFAIL()
{
	printf("Invalid count of 'a'\n");
	exit(0);
}

int yyerror()
{
	printf("Invalid string\n");
	exit(0);
}


/*   OUTPUT 
[root@localhost ss]# lex 2.l
[root@localhost ss]# yacc -d 2.y
[root@localhost ss]# cc lex.yy.c y.tab.c -ll
[root@localhost ss]# ./a.out
Enter the value of n 
2Enter the string
aab
Valid string
[root@localhost ss]# ./a.out
Enter the value of n 
2Enter the string
aaab
Invalid Count of 'a' 
[root@localhost ss]# ./a.out
Enter the value of n 
2Enter the string
aabb
Invalid string

*/

