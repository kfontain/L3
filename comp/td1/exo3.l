%{
int a = 0;
int b = 0;
%}

%%

a  {a += 1; yymore();}
b  {b += 1; yymore();}
[^ab] {
        if ((a%2 == 0) && (b%2 == 1))
        {
          printf("%s", yytext);
        };
        a = 0;
        b = 0;
      }

%%

int main()
{
  yylex();
  printf("\n");
  return 0;
}
