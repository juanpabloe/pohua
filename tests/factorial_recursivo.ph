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
     foo = factorialRecursivo(10);
     imprime(foo);

  fin
     
fin