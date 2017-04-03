#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <math.h>
#include "tp1.h"


// Pour chacune des quatre fonctions suivantes on supposera que le
// paramètre R est un nombre de taille suffisante pour recevoir le
// résultat de l'opération. On supposera aussi que les opérandes X et
// Y représentent des nombres valides (au moins 1 chiffre, pointeur
// non NULL, etc.). C'est donc à l'appellant de s'en assurer, pas la
// fonction. Les opérandes X,Y sont considérés positifs. Attention !
// Il est possible que X et Y ne soient pas de la même taille.

// Copie src dans dst.
// src et dst doivent être de même taille.
void number_copy(number *src, number *dst) {
    for (int i = 0 ; i < dst->n ; ++i) {
        dst->digit[i] = src->digit[i];
    }
    return;
}

// calcule R = X+Y en O(n)
void number_addition(number *R, number *X, number *Y) {
    int max_size = max(X->n, Y->n);
    int min_size = min(X->n, Y->n);

    // Allocation et initialisation d'un tableau stockant le max. des deux nombres.
    number *maximum = number_new(max_size);
    max_size == X->n ? number_copy(X, maximum) : number_copy(Y, maximum);

    // Allocation et initialisation d'un tableau stockant les retenues.
    number *ret = number_new(max_size + 1);
    for (int tmp = 0 ; tmp < max_size + 1 ; ++tmp) {
        ret->digit[tmp] = 0;
    }

    int sum;
    // Addition de la partie "commune" des deux nombres X et Y.
    for (int i = 0 ; i < min_size ; ++i) {
        sum = X->digit[i] + Y->digit[i] + ret->digit[i];
        if (sum > BASE) ret->digit[i + 1] += 1;
        R->digit[i] = sum%BASE;
    }

    // Reste de l'addition avec la partie "non-commune" en utilisant le maximum.
    for (int j = min_size ; j < max_size + 1; ++j) {
        sum = maximum->digit[j] + ret->digit[j];
        if (sum > BASE) ret->digit[j + 1] += 1;
        R->digit[j] = sum%BASE;
    }

    // free & return.
    number_free(maximum);
    number_free(ret);
    return;
}

// calcule R = X-Y en O(n), en supposant que X>=Y
void number_substraction(number *R, number *X, number *Y) {
    int max_size = X->n;
    int min_size = Y->n;

    // Allocation et initialisation d'un tableau stockant les retenues.
    number *ret = number_new(max_size + 1);
    for (int tmp = 0 ; tmp < max_size + 1 ; ++tmp) {
        ret->digit[tmp] = 0;
    }

    int diff;
    // Soustraction de la partie "commune" des deux nombres X et Y.
    for (int i = 0 ; i < max_size ; ++i) {
        if (i < min_size) {
            diff = X->digit[i] - Y->digit[i] - ret->digit[i];
            if (diff < 0) {
                ret->digit[i + 1] += 1;
                diff = BASE + diff;
            }
        }

        // Soustraction de la partie "non-commune" en utilisant X et les retenues.
        else {
            diff = X->digit[i] - ret->digit[i];
            if (diff < 0) {
                ret->digit[i + 1] += 1;
                diff = BASE + diff;
            }
        }
        R->digit[i] = diff;
    }

    // free & return.
    number_free(ret);
    return;
}


// calcule R = X*Y selon la méthode standard en O(n^2)
void number_mul_standard(number *R, number *X, number *Y) {

    for (int i = 0 ; i < X->n ; ++i) {
        for (int j = 0 ; j < X->digit[i]*pow(BASE, i) ; ++j) {
            printf("coucou \n");
            number_addition(R, Y, R);
        }
    }
    return;
}


// calcule R = X*Y selon la méthode récursive en O(n^2)
void number_mul_recursive(number *R, number *X, number *Y){
  return;
}


// calcule R = X*Y selon la méthode de Karastuba en O(n^1.59)
void number_mul_karastuba(number *R, number *X, number *Y){
  return;
}


int main(int argc, char *argv[]){

  srandom(time(NULL));
  BASE=2; // base par défaut

  if(argc==2){
    //
    // partie à ne pas modifier
    //
    number X,Y;
    void (*f)(number*,number*,number*);
    switch(read(argv[1],&X,&Y)){ // lit le fichier
    case 'a': f=number_addition;      break;
    case 's': f=number_substraction;  break;
    case 'm': f=number_mul_standard;  break;
    case 'r': f=number_mul_recursive; break;
    case 'k': f=number_mul_karastuba; break;
    default: printf("Unknown operator.\n"); exit(1);
    }
    number *R=number_new(2*max(X.n,Y.n));
    f(R,&X,&Y); // teste l'opération
    write(R,'\n'); // affiche le résultat
    number_free(R);
    return 0;
  }

  if(argc==5){
    //
    // partie à ne pas modifier
    //
    BASE=atoi(argv[1]);
    printf("%hd %s\n",BASE,argv[2]);
    write(number_random(atoi(argv[3])),'\n');
    write(number_random(atoi(argv[4])),'\n');
    return 0;
  }

  // pour vos tests personnels, si nécessaire, modifier le main()
  // seulement ci-dessous

  ;;;;
  ;;;;
  ;;;;

  return 0;
}
