%{

%}

PP1   (je)
PP2   (tu)
PP3   (il)
PP4   (nous)
PP5   (vous)
PP6   (ils)
V1    [ ]\[[a-z]+er\]

%%

{PP1}{V1}   { yytext[yyleng-3] = 0; printf("je %se"    , yytext+4); }
{PP2}{V1}   { yytext[yyleng-3] = 0; printf("tu %ses"   , yytext+4); }
{PP3}{V1}   { yytext[yyleng-3] = 0; printf("il %se"    , yytext+4); }
{PP4}{V1}   { yytext[yyleng-3] = 0; printf("nous %sons", yytext+6); }
{PP5}{V1}   { yytext[yyleng-3] = 0; printf("vous %sez" , yytext+6); }
{PP6}{V1}   { yytext[yyleng-3] = 0; printf("ils %sent" , yytext+5); }

%%

int main() {
  yylex();
}
