clase Pelicula:

	string titulo;
	ent minutos;
	flot precio;
  flot descuento;

  metodo string getTitulo():
    regresa este.titulo;
  fin

fin

clase Principal:

  metodo flot calcula(flot numero, flot dos):
    numero = numero + dos;
    regresa numero;
  fin

  metodo vacuo principal:

     flot exponente;
     exponente = 10.1e+10;

     flot foo;
     foo = calcula(10.0, exponente);
     
     imprime(foo);

     Pelicula p;
     p = nueva Pelicula();
  fin
     
fin

