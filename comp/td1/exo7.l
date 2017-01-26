%{

char rmp11  = 'b';
char rmp12  = 'c';
char rmp21  = 'c';
char rmp22  = 'd';


%}


R1 (aa)+b
R2 (ab)+b
R3 [ab]

%%

{R1}   {
        printf(" [");
        for(int i=0; i < yyleng-1; i++)
	    printf("%c",rmp11);
	printf("%c]",rmp12);}

{R2}   {
        printf(" [");
        for(int i=0; i < yyleng-1; i+=2)
	    printf("%c%c",rmp21,rmp22);
	printf("%c]",rmp22);}

{R3}    {printf(" [%s]",yytext);}


<<EOF>>  {return 1;}

%%

int main()
{
yylex();
}
