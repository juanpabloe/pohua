clase Persona:
	string nombre;
	ent edad;

	metodo vacuo setNombre(string nombre):
		este.nombre = nombre;
	fin

	metodo vacuo setEdad(ent edad):
		este.edad = edad;
	fin

	metodo string getNombre():
		regresa este.nombre;
	fin

	metodo ent getEdad():
		regresa este.edad;
	fin
fin

clase Estudiante extiende Persona:
	string matricula;
	ent [3] calificaciones;

	metodo vacuo setMatricula(string matricula):
		este.matricula = matricula;
	fin

	metodo vacuo setCalificaciones(ent cal1, ent cal2, ent cal3):
		calificaciones[0] = cal1;
		calificaciones[1] = cal2;
		calificaciones[2] = cal3;

		ent i;
		i = 0;
		mientras(i < 3):
			imprime(calificaciones[i]);
			i = i + 1;
		fin
	fin

	metodo string getMatricula():
		regresa este.matricula;
	fin
fin

clase Profesor:
	string nomina;
	string materia;

	metodo vacuo setNomina(string nomina):
		este.nomina = nomina;
	fin

	metodo vacuo setMateria(string materia):
		este.materia = materia;
	fin

	metodo string getMateria():
		regresa este.materia;
	fin

	metodo string getNomina():
		regresa este.nomina;
	fin

fin

clase Principal:
	metodo vacuo principal:
		ent [3] notas;

		Estudiante e;
		e = nuevo Estudiante();

		e.setNombre("Pedro");
		e.setEdad(21);
		e.setMatricula("A00801545");

		imprime("Alumno:");
		imprime(e.getEdad());
		imprime("Introduce Calificacion 1:");
		notas[0]= lee();
		imprime("Introduce Calificacion 2:");
		notas[1] = lee();
		imprime("Introduce Calificacion 3:");
		notas[2] = lee();
		imprime("Calificaciones");
		e.setCalificaciones(notas[0], notas[1], notas[2]);

		Profesor p;
		p = nuevo Profesor();

		p.setNombre("Elda");
		p.setNomina("L00988747");
		p.setMateria("Compiladores");

		imprime("Profesor:");
		imprime(p.getNombre());
		imprime(p.getMateria());

	fin
fin