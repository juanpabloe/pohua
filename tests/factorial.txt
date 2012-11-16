clase Principal:

metodo ent factorialIterativo(ent n):
        ent i;
	ent resultado;

        resultado = 1;

	para(i = n; i > 1; i = i - 1;):
	    resultado = i * resultado;
	    imprime(resultado);
	fin
	
	regresa resultado;
fin

metodo ent factorialIterativo2(ent n):
	ent resultado;

        resultado = 1;

	mientras(n > 1):
	    resultado = n * resultado;
	    imprime(resultado);
	    n = n - 1;
	fin
	
	regresa resultado;
fin
  
metodo vacuo principal:
    ent num;

    num = 5;

    ent fact; 
    fact = factorialIterativo(num);

    imprime("Resultado");
    imprime(fact);
     
  fin

fin


