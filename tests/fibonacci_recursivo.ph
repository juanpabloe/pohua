clase Principal:

  metodo ent fiboRecursivo(ent numero):
    ent temp;
    ent temp2;
    si?(numero == 1 || numero == 2):
      regresa 1;
    sino
      temp = numero - 1;
      temp2 = numero - 2;
      regresa fiboRecursivo(temp) + fiboRecursivo(temp2);
    fin
  fin

  metodo vacuo principal:

     ent foo;
     foo = fiboRecursivo(30);
     imprime(foo);

  fin
     
fin
