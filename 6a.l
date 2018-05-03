/* 6. a) Write a LEX program to eliminate comment lines in a C program and copy the resulting
   program into a separate file.

*/

%{ 
#include<stdio.h> 
        int com=0; 
%} 
%%
"//".* {com++;} 
"/*"([^*]|\*+[^*/])*\*+"/" {com++;} 
.|\n {fprintf(yyout,"%s",yytext);} 
%% 

void main(int argc, char *argv[]) 
{         
        yyin=fopen(argv[1],"r"); 
        yyout=fopen(argv[2],"w"); 
        yylex(); 
        printf("No of comment lines=%d\n",com);        
} 


/*  OUTPUT 

[root@localhost ss]# lex 6a.l
[root@localhost ss]# cc lex.yy.c -ll
[root@localhost ss]# ./a.out comin.c comout.c
No of comment lines=5
[root@localhost ss]# cat comout.c

#include<stdio.h>

void main()
{

int a,b,c;  
a= b+c;
}


[root@localhost ss]# gedit comin.c
//welcome to BIT
#include<stdio.h>
/*   Main begins
*/
void main()
{
// declaration
int a,b,c;  //  integer types
a= b+c;
/* *************
********nmm,,*/
}


