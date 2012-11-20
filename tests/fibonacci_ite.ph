clase Principal:
	metodo ent fibonacci(ent n):
		ent a;
		ent b;
		ent c;
		ent i;

		a = 0;
		b = 1;
		c = 0;
		i = 1;
		mientras(i < n || i == n):
			a = b;
			b = c;
			c = a + b;
			i = i + 1;
		fin

		regresa c;
	fin
	metodo vacuo principal:
		ent numero;

		imprime("Introduce n para calcular fibonacci:");
		numero = lee();

		ent resultado;
		resultado = fibonacci(numero);

		imprime(resultado);
	fin
fin