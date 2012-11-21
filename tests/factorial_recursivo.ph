clase Principal:

  metodo ent factorialRecursivo(ent numero):
    si?(numero == 1):
      regresa 1;
    sino
      regresa numero * factorialRecursivo(numero-1);
    fin
  fin

  metodo vacuo principal:
    ent foo;
    ent n;

    imprime("Introduce n:");
    n = lee();
    foo = factorialRecursivo(n);
    imprime(foo);

  fin
fin
