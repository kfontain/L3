%{
#include <string.h>

typedef struct function{
    char* name;
    int nb;
}fct;

fct def;
fct call;

%}

lettre  [A-Za-z]
chiffre [0-9]
type    (int) | (bool)
mot     ((lettre)+(chiffre)*)*
arg     mot:type
sep     [ \t\n]+
def     (defun)

%s      Qdef Qcall

%%

{def}{sep}{mot}\(   { BEGIN Qdef; }
<Qdef>{arg}         { def.nb++; }
<Qdef>\)            { BEGIN INITIAL; }

{mot}\(             { BEGIN Qcall; }
<Qcall>{mot}        { call.nb++; }
<Qcall>\)           { BEGIN INITIAL; }

.                   { ; }
<<EOF>>             {return 1; }

%%

int main()
{
    yylex();
    printf("def : %d, call : %d\n", def.nb, call.nb);
    if ( def.nb == call.nb )
    {
        printf("Appel conforme\n");
    }
    else
    {
        printf("Appel non conforme\n");
    }

    printf("\n");
}
