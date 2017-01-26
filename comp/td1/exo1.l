%{
int res = 0;
%}

%%

abb {res = 1;}

%%

int main()
{
  yylex();
  if (res == 1) printf("Facteur vu\n");
  else printf("Facteur non vu\n");

  return 0;
}
