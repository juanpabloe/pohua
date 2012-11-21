clase Principal:

  metodo ent fiboRecursivo(ent numero):
    si?(numero == 0):
      regresa 0;
    fin

    si?(numero == 1 || numero == 2):
      regresa 1;
    sino
      regresa fiboRecursivo(numero-1) + fiboRecursivo(numero-2);
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
