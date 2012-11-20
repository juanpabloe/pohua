clase Banco:
	string ciudad;

	metodo vacuo setCiudad(string ciudad):
		este.ciudad = ciudad;
	fin

	metodo string getCiudad():
		regresa este.ciudad;
	fin
fin

clase Cuenta extiende Banco:
	flot saldo;
	ent numero;

	metodo vacuo setSaldo(flot cantidad):
		este.saldo = cantidad;
	fin

	metodo flot getSaldo():
		regresa este.saldo;
	fin

	metodo vacuo aumentaSaldo(flot cantidad):
		este.saldo = este.saldo + cantidad;
	fin

	metodo vacuo restaSaldo(flot cantidad):
		este.saldo =  este.saldo - cantidad;
	fin

	metodo vacuo setNumero(ent numero):
		este.numero = numero;
	fin

	metodo ent getNumero():
		regresa este.numero;
	fin
fin

clase Principal:
	metodo vacuo principal:
		Cuenta c;
		c = nueva Cuenta();

		c.setCiudad("Monterrey");
		c.setNumero(1234);
		c.setSaldo(1500.00);

		imprime("Cuenta:");
		imprime(c.getNumero());
		imprime("Saldo:");
		imprime(c.getSaldo());

		c.aumentaSaldo(550.50);
		imprime("Saldo aumentado:");
		imprime(c.getSaldo());

		c.restaSaldo(500.0);
		imprime("Saldo disminuido:");
		imprime(c.getSaldo());

	fin
fin
