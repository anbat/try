%{

#include<stdio.h>
int valid=1;
%}
%token NUM
%left '+' '-'
%left '*' '/'
%%
Stmt:expr{if(valid)
		{printf("Result=%d\n",$$);}
          }
expr:expr'+'expr {$$=$1+$3;}
    |expr'-'expr {$$=$1-$3;}
    |expr'*'expr {$$=$1*$3;}
    |expr'/'expr {if($3==0){
			valid=0;printf("Divide by zero error\n");}
		else
			$$=$1/$3;}
    |'('expr')' {$$=$2;}
    |NUM {$$=$1;}
    ;
%%

main()
{
	printf("Enter arithmetic exression:\n");
	yyparse();
	if(valid==1)
		printf("expression is valid\n");
}

int yyerror()
{
	printf("Invalid expression\n");
	exit(0);
}	 

