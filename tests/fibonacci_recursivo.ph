clase Principal:

  metodo ent fiboRecursivo(ent numero):
    ent temp;
    ent temp2;
    
    si?(numero == 0):
      regresa 0;
    fin
    
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
     ent n;
     
     imprime("Introduce n:");
     n = lee();

     foo = fiboRecursivo(n);
     imprime(foo);

  fin
     
fin
