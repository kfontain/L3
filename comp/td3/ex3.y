%{

#include <stdio.h>
#include <string.h>

int na;

int yylex() {
    getchar();
}

int yyerror(char *s) {
    fprintf(stderr, "*** ERROR : %s ***\n", s);
    return 0;
}

%}

%start A

%%

A: S'\n'      { return 0; }
S: 'a'S'b'    { na++; }
 | 'a''b'     { na++; }
 ;

%%

int main()
{
    yyparse();
    return 0;
}
