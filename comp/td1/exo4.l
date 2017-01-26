%{
int a = 0;
int b = 0;
int c = 0;
%}

%%

a  {a++; yymore();}
b  {b++; yymore();}
c  {c++; yymore();}
[^abc] {
        if ((a == b) && (b == c))
        {
          printf("%s", yytext);
        };
        a = 0;
        b = 0;
        c = 0;
       }

%%

int main()
{
  yylex();
  printf("\n");
  return 0;
}
