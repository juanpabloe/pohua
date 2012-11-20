clase Principal:

  metodo string encuentraN(ent numero):
    
    ent [15] arreglo;

    arreglo[0] = 10;
    arreglo[1] = 8;
    arreglo[2] = 3;
    arreglo[3] = 4;
    arreglo[4] = 0;
    arreglo[5] = 14;
    arreglo[6] = 1;
    arreglo[7] = 15;
    arreglo[8] = 6;
    arreglo[9] = 24;
    arreglo[10] = 2;
    arreglo[11] = 33;
    arreglo[12] = 5;
    arreglo[13] = 9;
    arreglo[14] = 11;

    ent i;
    i = 0;
    mientras(i < 15):
      si?(arreglo[i] == numero):
        regresa "Numero Encontrado";
      fin
      i = i + 1;
    fin
    regresa "Numero NO Encontrado";
  fin

  metodo vacuo principal:
     ent encuentra;
     
     imprime("Escribe un numero entero: ");
     encuentra = lee();

     imprime(encuentraN(encuentra));

  fin
     
fin
