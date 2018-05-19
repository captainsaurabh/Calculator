%{
    #include<stdio.h>
    #include<math.h>
    #include <stdlib.h>
    extern int yylex();
	int yyerror(char *msg);
%}

%code
{
   #define YYSTYPE double
}

%token INTEGER FLOAT
%token ADD SUB 
%token MUL DIV
%token OP CP EOL


%%
    calculator:
              | calculator exp EOL {printf("= %g\n", $2);}
              ;
    exp:
       factor
       | exp ADD factor  {$$ = $1 + $3;}
       | exp SUB factor  {$$ = $1 - $3;}
       ;
    factor:
          term
          | factor MUL term  {$$ = $1 * $3;}
          | factor DIV term  {$$ = $1 / $3;}
          ;
    term:
        INTEGER
        | FLOAT
        | OP exp CP {$$ = $2;}
        ;

%%
int main(int argc, char **argv)
{
	yyparse();
}
int yyerror(char *msg)
{
  	fprintf(stderr, "error: %s\n", msg);
}

