%{
int pos = 0;
int res[] = {0, 0, 0, 0};
%}

M1 cabb
M2 cbab
M3 cbb
M4 cbbba

%%

[abc]     {pos++;}
{M1}      {printf("Occurence %s, position %d\n", yytext, pos) ; pos += yyleng;}
{M2}      {printf("Occurence %s, position %d\n", yytext, pos) ; pos += yyleng;}
{M3}      {printf("Occurence %s, position %d\n", yytext, pos) ; pos += yyleng;}
{M4}      {printf("Occurence %s, position %d\n", yytext, pos) ; pos += yyleng;}
<<EOF>>   {return 1;}

%%

int main()
{
  //[^abc]    {printf("non-alphabet\n"); return 0;}

  yylex();
  printf("\n");
  return 0;
}
