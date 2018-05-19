%{
	#include "calc.tab.h"
	#include <math.h>
%}

digit [0-9]
integer {digit}+
float {integer}+("."integer)?

%%

"+"    {return ADD;}
"-"    {return SUB;}
"*"    {return MUL;}
"/"    {return DIV;}
"("    {return OP;}
")"    {return CP;}
{integer}  {yylval=atoi(yytext); return INTEGER;}
{float}    {yylval=atof(yytext); return FLOAT;}
\n   {return EOL;}
[ \t]   {}
.     {printf("invalid_symbol %c\n", *yytext);exit(0);}
%%
