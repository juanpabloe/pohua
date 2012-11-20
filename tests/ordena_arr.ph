clase Principal:

  metodo vacuo ordena_MayorAMenor():
    
    ent [5] arreglo;

    arreglo[0] = 1;
    arreglo[1] = 8;
    arreglo[2] = 3;
    arreglo[3] = 4;
    arreglo[4] = 0;

    ent i;
    ent j;
    ent t;
    ent x;
    t = 0;

    para(i = 0; i < 5; i = i + 1;):
        x = 5 - i;
        para(j = 1; j < x; j = j + 1;):
            si?(arreglo[j-1] > arreglo[j]):
                imprime(arreglo[j]);
                t = arreglo[j-1];
                imprime(t);
                arreglo[j-1] = arreglo[j];
                imprime(arreglo[j-1]);
                arreglo[j] = t;
                imprime(arreglo[j]);
            fin
        fin
    fin
    para(i = 0; i < 4; i = i + 1;):
        imprime(arreglo[i]);
    fin

  fin

  metodo vacuo principal:
     
     ordena_MayorAMenor();

  fin
     
fin
