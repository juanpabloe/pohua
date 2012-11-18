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

clase Libro:
	string titulo;
	string autor;
	ent paginas;

   metodo ent getPaginas():
   	regresa este.paginas;
   fin

   metodo vacuo constructorLibro(string t, ent p, string a):
   	este.titulo = t;
	este.paginas = p;
	este.autor = a;
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

     Libro lib;
     lib = nuevo Libro();

     lib.constructorLibro("Oliver Twist",56, "Charles Dickens");
     ent pag;
     pag = lib.getPaginas();
     
     imprime(pag);

  fin
     
fin

