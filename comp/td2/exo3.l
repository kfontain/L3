%{
#include <string.h>

struct identificateur{
       char *s;
       int nb_occur;
       struct identificateur *next;
};

typedef struct identificateur ident;


ident *first = NULL;
ident *last = NULL;

%}

Enlever while|do|if|then|else|for|return|\:|\(|\)|[ ]|\;|\=|\*|\+|\-|\/|\{|\}
Garder [A-Za-z][A-Za-z0-9\-\_]*

%%

{Enlever} {}
[0-9] {}
[\n] {return 0;}

{Garder} {ident *curr = first;
         do{
              if(curr == NULL){
                curr = malloc(sizeof(ident));
                curr->s = malloc(yyleng * sizeof(char));
                strcpy(curr->s,yytext);
                curr->nb_occur = 0;
                curr->next = NULL;
first = curr;
              }
              else{
                if(strcmp(yytext,curr->s) == 0){
                  curr->nb_occur++;
                  break;
                }
else {
last = curr;
curr=curr->next;
}
              }
          }while(curr != NULL);
           if(curr==NULL){ 
      
            last->next = malloc(sizeof(ident));
            curr = last->next;
            curr->s = malloc(yyleng * sizeof(char));
            strcpy(curr->s,yytext);
            curr->nb_occur = 1;
            curr->next = NULL;

}
     ;}
%%


int main()
{
yylex();
while(first!=NULL){
  printf(" ( %s : %d ) ",first->s,first->nb_occur);
  first = first->next;
}
printf("\n");
}
