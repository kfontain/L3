%{


%}

sep [ .\t\n]
R1 Alpes
R2 loup
R3 loups
R4 chamois
R5 Pralognan

%%

{R1}/{sep}    { printf("Pyrenees"); }
{R2}/{sep}    { printf("ours"); }
{R3}/{sep}    { printf("ours"); }
{R4}/{sep}    { printf("izard"); }
{R5}/{sep}    { printf("Saint - Girons"); }
{sep}         { printf("%s", yytext); }

%%

int main() {
  yylex();
}
