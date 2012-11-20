clase Principal:

  metodo ent factorialRecursivo(ent numero):
    ent temp;
    si?(numero == 1):
      regresa 1;
    sino
      temp = numero - 1;
      regresa numero * factorialRecursivo(temp);
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
