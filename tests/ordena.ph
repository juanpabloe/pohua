clase Principal:

  metodo vacuo ordena_MayorAMenor():
    
    ent [15] arreglo;

    arreglo[0] = 1;
    arreglo[1] = 8;
    arreglo[2] = 3;
    arreglo[3] = 4;
    arreglo[4] = 0;
    arreglo[5] = 6;
    arreglo[6] = 15;
    arreglo[7] = 10;
    arreglo[8] = 6;
    arreglo[9] = 24;
    arreglo[10] = 2;
    arreglo[11] = 33;
    arreglo[12] = 5;
    arreglo[13] = 9;
    arreglo[14] = 11;

    ent i;
    i = 0;
    ent j;
    ent t;
    ent x;
    t = 0;


    mientras(i < 15):
        j = i;
        mientras(j < 15):
            si?(arreglo[i] > arreglo[j]):
                t = arreglo[i];
                arreglo[i] = arreglo[j];
                arreglo[j] = t;
            fin
            j = j + 1;
        fin
        i = i +1;
    fin

    para(i = 0; i < 15; i = i + 1;):
        imprime(arreglo[i]);
    fin

  fin

  metodo vacuo principal:
     
     ordena_MayorAMenor();

  fin
     
fin
