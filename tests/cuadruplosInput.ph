clase Pelicula:
	string titulo;
	ent minutos;
	flot precio;

   metodo vacuo setTitulo(string titulo):
   	este.titulo = titulo;
   fin
 
   metodo string getTitulo:
    regresa titulo
   fin
fin

clase Principal:

  metodo vacuo principal:

     flot exponente;
     ent foo;
     exp = 10.8;
     foo = lee();

     mientras(exp > 0):
       imprime("El exponente es:", exp);
       exp = exp / 2;
     fin

     Pelicula p;
     p = nuevo Pelicula;
     string titulo;
     titulo = p.getTitulo();

     ent num;
     num = 2;

     si?(titulo == "Pinocho"):
        imprime("Pinocho");
     sino
        imprime("Otro");
     fin
  fin

fin
