clase Principal:

  metodo vacuo principal:

     ent [10] arreglo;

     arreglo[5] = -10;
     imprime(arreglo[5]);

     arreglo[5] = arreglo[5] + 30;
     imprime(arreglo[5]);

     ent temp;
     temp = arreglo[5];
     imprime(temp);
     
     ent i;
     para(i = 0; i < 10; i = i + 1;):
        arreglo[i] = i * 2;
        imprime(arreglo[i]);
     fin

  fin

fin
