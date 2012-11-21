clase Articulo:
  string categoria;
	flot precio;

  metodo vacuo setCategoria(string categoria):
    este.categoria = categoria;
  fin

  metodo string getCategoria():
    regresa categoria;
  fin

fin

clase Pelicula extiende Articulo:

	string titulo;
	ent minutos;

  metodo string getTitulo():
    regresa este.titulo;
  fin

  metodo vacuo setTitulo(string titulo):
    este.titulo = titulo;
  fin

fin

clase Titanic extiende Pelicula:

  metodo flot getPrecio():
    regresa precio;
  fin

  metodo vacuo setPrecio(flot precio):
    este.precio = precio;
  fin

fin

clase Principal:

  metodo vacuo principal:
     Titanic p;
     p = nuevo Titanic();

     p.setTitulo("Peliculon del anio");
     p.setCategoria("Romanticas");
     p.setPrecio(199.99);

     imprime("Titulo:");
     imprime(p.getTitulo());
     imprime("Categoria:");
     imprime(p.getCategoria());
     imprime("Precio:");
     imprime(p.getPrecio());

  fin
     
fin

