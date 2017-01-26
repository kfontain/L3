%{

%}

%%

a   {printf("b");}
b   {printf("c");}
c   {printf("a");}

%%

int main()
{
  yylex();
  printf("\n");
  return 0;
}
