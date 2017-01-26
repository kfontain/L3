%{

%}

%%

(aa)+b  {printf("[%s]", yytext);}
(ab)+b  {printf("[%s]", yytext);}
[ab]    {printf("[%s]", yytext);}

%%

int main()
{
  yylex();
  printf("\n");
  return 0;
}
