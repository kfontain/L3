%{

%}

number [0-9]*

%%

{number}  {return 0;}
.         {return (int)yytext[0];}

%%

int yywrap(){
    return 1;
}

int main()
{
    int c;
    while ((c = yylex())!='∕n')
        printf("%d\n", c);
}
