clase Nodo:
	ent contenido;
	Nodo siguiente;

	metodo vacuo setContenido(ent contenido):
		este.contenido = contenido;
	fin
	
	metodo vacuo setSiguiente(Nodo siguiente):
		este.siguiente = nuevo Nodo();
	fin
	
fin

clase Lista:
fin

clase Principal:
	metodo vacuo principal:
		imprime("hola");
	fin
fin