clase Pelicula:

	string titulo;
	ent minutos;
	flot precio;
  flot descuento;

  metodo string getTitulo():
    regresa este.titulo;
  fin

  metodo vacuo setTitulo(string t):
    este.titulo = t;
  fin

fin

clase Principal:

  metodo vacuo principal:

     Pelicula p;
     p = nueva Pelicula();
     p.setTitulo("Titanic");
      
     string tit;
     tit = p.getTitulo();
     imprime(tit);
      
     p.setTitulo("Pulp fiction");
     imprime(p.getTitulo());

  fin
     
fin

