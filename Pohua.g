grammar Pohua;

options { language = Ruby; }

@header {
  require 'tabla_semantica.rb'
}

@members {

class Variable
  attr_accessor :nombre, :direccion, :tipo

  def initialize(nombre, tipo)
    @nombre = nombre
    @tipo = tipo
    @direccion = nil
  end

end

class Metodo
  attr_accessor :nombre, :variables_locales, :parametros, :tipo_de_retorno,
                :clase_envase, :sig_direccion, :primer_cuadruplo

  DIR_INICIAL = 50
  DIR_FINAL = 99

  def initialize(nombre, tipo_de_retorno = 'vacuo', clase_envase = nil)
    @nombre = nombre
    @tipo_de_retorno = tipo_de_retorno  # Tipo como Ent, Flot, Vacuo, Boolean.
    @clase_envase = clase_envase        # Clase en la que se encuentra el metodo
    @variables_locales = Hash.new       # Hash con objetos de la clase Variable
    @parametros = Hash.new              # Hash con objetos de la clase Variable
    @sig_direccion = DIR_INICIAL  # Se ubica en la primer direccion disponible para variables
  end

  def guardar_en_variables_locales(nombre, var)
    var.direccion = @sig_direccion
    @sig_direccion = @sig_direccion + 1
    # Revisamos la unicidad de la variable
    if(@variables_locales[nombre].nil?)
      @variables_locales[nombre] = var
    else
      raise "La variable #{nombre} ya habia sido declarada en el metodo #{@nombre}"
    end
  end

  def guardar_en_parametros(nombre, var)
    # Revisamos si el parametro no viene repetido
    if @parametros[nombre].nil?
      @parametros[nombre] = var
      guardar_en_variables_locales(nombre, var)
    else
      raise "El parametro #{nombre} ya habia sido enviado en el metodo #{@nombre}"
    end
  end

  def cantidad_de_parametros
    @parametros.count
  end

  def cantidad_de_variables_locales
    @variables_locales.count
  end

end

class Clase
  attr_accessor :nombre, :variables_instancia, :metodos_instancia, :sig_direccion, 
                :primer_cuadruplo, :clase_padre

  # To-do: Agregar un atributo para la clase padre en el caso de herencia

  DIR_INICIAL = 100
  DIR_FINAL = 149

  def initialize(nombre)
    @nombre = nombre
    @variables_instancia = Hash.new      # Hash con objetos de la clase Variable
    @metodos_instancia = Hash.new        # Hash con objetos de la clase Metodo
    @sig_direccion = DIR_INICIAL         # Se ubica en la primer direccion disponible para variables
    @clase_padre = nil                   # Por default no hay una clase padre
  end

  def guardar_en_variables_de_instancia(nombre, var)
    var.direccion = @sig_direccion
    @sig_direccion = @sig_direccion + 1
    # Revisamos la unicidad de la variable
    if(@variables_instancia[nombre].nil?)
      @variables_instancia[nombre] = var
    else
      raise "La variable #{nombre} ya habia sido declarada en #{@nombre}"
    end
  end

end

class Constante
  attr_accessor :valor, :tipo, :direccion

  def initialize(valor, tipo, direccion)
    @valor = valor
    @tipo = tipo
    @direccion = direccion
  end

end

}

@parser::init {
  @p_operadores = []     #Pila de operadores en la generacion de cuadruplos
  @p_operandos = []      #Pila de operando en la generacion de cuadruplos
  @p_tipos = []          #Tipos de los operandos
  @p_saltos = []         #Pila de saltos

  @p_cuadruplos = []    # Pila de cuadruplos final
  @cont = 1             # Contador de cuadruplos.

  @p_temp_cuadruplos = [] # Pila temporal de cuadruplos utilizada en ciclo PARA
  @for_flag = false  # Bandera que indica si el programa se encuentra en ciclo PARA

  @clase_actual = nil   # Variable que apuntara a la clase actual durante el parseo
  @metodo_actual = nil  # Variable que apuntara al metodo actual durante el parseo
  @instancia_actual = nil   # Variable que indicara el scope de clase donde se llama a un metodo

  @clases = {}          # Hash para indexar las clases detectadas en el programa
  @constantes = {}  # Hash para indexar las constantes detectadas en el programa

  @tabla = TablaSemantica.new   # Creamos nuestra tabla semantica. Para acceder a los valores usa @tabla.t

  # Direcciones de memoria virtual para constantes
  @dir_cons = []
  lambda { 100.times { |i| @dir_cons.push (i+200).to_s } }.call   # Crea 100 direcciones iniciando en 200

  # Direcciones de memoria virtual para registros temporales
  @dir_temps = []
  lambda { 100.times { |i| @dir_temps.push (i+300).to_s } }.call   # Crea 100 direcciones iniciando en 300

  # Metodos para obtener una direccion disponible
  def dir_constante_disponible
    @dir_cons.shift
  end

  def dir_temporal_disponible
    @dir_temps.shift
  end

  def genera_cuadruplo(op, operando1, operando2, dir_resultado)
    # To-do: por lo pronto solo regresa un arreglo de 4 posiciones, 
    # pero se debe aqui imprimir al archivo que leera la maquina virtual
    cuad = [op, operando1, operando2, dir_resultado]

    # Si el programa se encuentra en un ciclo PARA (estilo for) se utilizara una pila temporal de cuadruplos 
    # para guardar los cuadruplos de la asignacion del ciclo for, y dejara intacta la pila general de cuadruplos.
    # Al final del ciclo para, agregara los cuadruplos a la pila general.
    if @for_flag
      @p_temp_cuadruplos << cuad
    else
      @p_cuadruplos << cuad
      @cont = @cont + 1
    end
  end

  # Metodo que inserta el resultado generado por el cuadruplo en la pila de operandos y su tipo en la PTipos
  # Utilizado en la etapa de Generacion de Codigo
  def inserta_nuevo_resultado_en_pila_operandos(operador)
    ultimos_dos_tipos = @p_tipos.last(2)
    if(not @tabla.t[operador][ultimos_dos_tipos.first][ultimos_dos_tipos.last].nil?)
      @p_tipos.pop(2)
      # Aqui se generaria el cuadruplo
      dir = dir_temporal_disponible
      op2 = @p_operandos.pop
      op1 = @p_operandos.pop
      genera_cuadruplo(@p_operadores.pop, op1, op2, dir)
      @p_operandos << dir
      @p_tipos << @tabla.t[operador][ultimos_dos_tipos.first][ultimos_dos_tipos.last]
    else
      raise "Tipos incompatibles entre #{ultimos_dos_tipos.first} y #{ultimos_dos_tipos.last}"
    end
  end

  def resuelve_salto_en_cuadruplo(posicion_cuadruplo, valor)
    # Busca el cuadruplo en la pila de cuadruplos, 
    # y en la cuarta posicion del cuadruplo le asigna el valor pendiente
    @p_cuadruplos[posicion_cuadruplo - 1][3] = valor.to_s
  end

  def maneja_argumentos
  end

  def imprime_clases
    puts "--- Clases ---"
    @clases.each do |nombre, contenido|
      puts "Clase: #{nombre}"
      contenido.variables_instancia.each_with_index do |(nv, cv), i|
      puts "Variable #{i}: #{nv}, tipo: #{cv.tipo}, direccion: #{cv.direccion}"
      end
      contenido.metodos_instancia.each do |nombre_m, contenido_m|
        puts "Metodo: #{nombre_m}"
        puts "Primer cuadruplo: #{contenido_m.primer_cuadruplo}"
        contenido_m.variables_locales.each_with_index do |(nombre_v, attrs), i|
        puts "Variable #{i}: #{nombre_v}, tipo: #{attrs.tipo}, direccion: #{attrs.direccion}"
        end
      end
    end
  end

  def imprime_cuadruplos
    @p_cuadruplos.each_with_index do |cuadruplo, i|
      puts "#{i} -- #{cuadruplo}"
    end
  end

  def imprime_cuadruplos_archivo
    lineas = ""
    @p_cuadruplos.each do |cuadruplo|
      lineas << cuadruplo.join(",") + "\n"
    end
    lineas
  end

  def imprime_constantes
    @constantes.each_with_index do |(constante_n, contenido_n), i|
      puts "Constante#{i}: #{constante_n}, tipo: #{contenido_n.tipo}, direccion: #{contenido_n.direccion}"
    end
  end

  def genera_archivo_cuadruplos
    File.open('codobj', 'w') { |arch| arch.write(imprime_cuadruplos_archivo)  }
  end
}


programa 
	:	clase*  clase_principal
  {
    # Se agrega el cuadruplo inicial que indica el numero del cuadruplo del metodo principal
    @p_cuadruplos.insert(0, ['goto', nil, nil, @clases['Principal'].metodos_instancia['principal'].primer_cuadruplo])
    imprime_cuadruplos
    imprime_clases
    imprime_constantes
    genera_archivo_cuadruplos
  }
	;

clase	
  :	'clase' c1 = CLASE_OB 
  ('extiende' c2 = CLASE_OB
  {
    # Implementacion de Herencia
    # Revisamos que la clase padre que se quiere extender haya sido declarada
    if @clases[$c2.text].nil?
      raise "La clase #{$c2.text} no ha sido previamente implementada."
    else
      # Si ya fue declarada, la buscamos dentro de nuestras clases
      @clase_padre = @clases[$c2.text]
    end
  }
  )? 
  {
    @clases[$c1.text] = Clase.new($c1.text)
    @clase_actual = @clases[$c1.text]

    # Revisamos si se quiere heredar de una clase
    if @clase_padre
      # Si hay una clase padre, le enviaremos sus variables y metodos a la clase actual
      @clase_padre.variables_instancia.each do |nombre_var, variable|
        @clase_actual.guardar_en_variables_de_instancia(nombre_var, variable)
        puts "Se guardo variable #{nombre_var} en clase #{@clase_actual.nombre}"
      end
      @clase_padre.metodos_instancia.each do |nombre_metodo, metodo|
        @clase_actual.metodos_instancia[nombre_metodo] = metodo
        puts "Se guardo metodo #{nombre_metodo} en clase #{@clase_actual.nombre}"
      end
      puts "La clase #{@clase_actual.nombre} ahora hereda de la clase #{@clase_padre.nombre}"
      @clase_actual.clase_padre = @clase_padre
    end
  }
  ':' dec_variable* metodo* 'fin'
  {
    @clase_actual = nil
  }
  ;

clase_principal
	:	'clase' 'Principal'
  {
    @clases['Principal'] = Clase.new('Principal')
    @clase_actual = @clases['Principal']
  }
		':' metodo* met_principal 'fin'
  {
    @clase_actual = nil
  }
	;
	
met_principal
	:	'metodo' 'vacuo' 'principal' 
    {
      @clase_actual.metodos_instancia['principal'] = Metodo.new('principal', 'vacuo', @clase_actual)
      @metodo_actual = @clase_actual.metodos_instancia['principal']
      @metodo_actual.primer_cuadruplo = @cont

      # Enviamos el primer parametro de todo metodo que es la clase a la que pertenece
      var_instancia = Variable.new('principal', 'Principal')
      @metodo_actual.guardar_en_variables_locales(var_instancia.nombre, var_instancia)
      @instancia_actual = var_instancia
    }
    ':' bloque* 'fin'
    {
      @metodo_actual = nil
      # El cuadruplo halt indica el fin del programa
      genera_cuadruplo('halt', nil, nil, nil)
    }
	;

bloque	:	dec_variable
	|	estatuto
	;
	
dec_variable
	: t =	tipo ID // Revisar el scope de t para ver si el t = tipo es necesario
    {
      unless @metodo_actual.nil?
        # Si la variable se declara dentro de un metodo.
        @metodo_actual.guardar_en_variables_locales($ID.text, Variable.new($ID.text, $t.valor))
      else
        # Si la variable se declara dentro de una clase.
        @clase_actual.guardar_en_variables_de_instancia($ID.text, Variable.new($ID.text, $t.valor))
      end
    }
    ';'
	;

metodo	:	'metodo' (met_tipado | met_vacuo) ;

met_tipado
	: t =	tipo ID
  {
    @regresa_algo = false  # Flag que ayuda a detectar si el metodo regresa un valor
    @clase_actual.metodos_instancia[$ID.text] = Metodo.new($ID.text, $t.valor, @clase_actual)
    @metodo_actual = @clase_actual.metodos_instancia[$ID.text]
    @metodo_actual.primer_cuadruplo = @cont

    # Enviamos el primer parametro de todo metodo que es la clase a la que pertenece
    var_instancia = Variable.new('instancia', @clase_actual.nombre)
    @metodo_actual.guardar_en_variables_locales(var_instancia.nombre, var_instancia)
    @instancia_actual = var_instancia
  }
  '(' parametros? ')'
  ':' bloque* 'fin'
  {
    # Validamos que el metodo tipado regrese un valor al final
    unless @regresa_algo
      raise "El metodo #{@metodo_actual.nombre} debe regresar un tipo #{@metodo_actual.tipo_de_retorno}"
    end
    @metodo_actual = nil
  }
	;
	
met_vacuo
	:	'vacuo' ID 
  {
    @clase_actual.metodos_instancia[$ID.text] = Metodo.new($ID.text, 'vacuo', @clase_actual)
    @metodo_actual = @clase_actual.metodos_instancia[$ID.text]
    @metodo_actual.primer_cuadruplo = @cont

    # Enviamos el primer parametro de todo metodo que es la clase a la que pertenece
    var_instancia = Variable.new('instancia', @clase_actual.nombre)
    @metodo_actual.guardar_en_variables_locales(var_instancia.nombre, var_instancia)
    @instancia_actual = var_instancia.tipo
  }
  '(' parametros? ')'
  ':' bloque* 'fin'
  {
    genera_cuadruplo('ret', nil, nil, nil)
    @metodo_actual = nil
  }
	;
	
tipo
  returns [valor]:
  t = ( 'ent'	|	'flot' |	'string' |	'bol' |	'char' |	CLASE_OB ) { $valor = $t.text }
	;
	
parametros
	:	param ( ',' param )*
	;

param 
  : t = tipo ID
  {
    @metodo_actual.guardar_en_parametros($ID.text, Variable.new($ID.text, $t.valor))
  }
  ;
	
estatuto
	:	asignacion
	|	condicion
	|	escritura
	|	ciclo
  | devolucion
	|	invocacion ';'
	;
	
devolucion
  : 'regresa' expresion 
  {
    resultado = @p_operandos.pop
    resultado_tipo = @p_tipos.pop
    if(resultado_tipo == @metodo_actual.tipo_de_retorno)
      genera_cuadruplo('ret', nil, nil, resultado)
      @regresa_algo = true
    else
      if(@metodo_actual.tipo_de_retorno == 'vacuo')
        raise "El metodo #{@metodo_actual.nombre} no debe regresar ningun valor debido a que es vacuo"
      else
        raise "El metodo #{@metodo_actual.nombre} debe regresar un tipo #{@metodo_actual.tipo_de_retorno}"
      end
    end
  } ';'
  ;

asignacion
	: lado_izq_asignacion '='
  {
    # Regla 2 - Metemos '=' a pila operadores
    @p_operadores << '='
  }
  lado_der_asignacion ';' ;

lado_izq_asignacion
  : ('este' '.' ID)
  {
    unless @clase_actual.variables_instancia[$ID.text].nil?
      @p_operandos << @clase_actual.variables_instancia[$ID.text].direccion
      @p_tipos << @clase_actual.variables_instancia[$ID.text].tipo
    else
      raise "La variable #{$ID.text} no existe para la clase #{@clase_actual.nombre}"
    end
  }
  | ID
  {
    # Regla 1 GC - Asignacion
    # Validamos si se encuentra dentro de un metodo
    if !@metodo_actual.nil?
      # Revisamos si esa variable fue declarada previamente dentro del metodo
      if !@metodo_actual.variables_locales[$ID.text].nil?
        @p_operandos << @metodo_actual.variables_locales[$ID.text].direccion
        @p_tipos << @metodo_actual.variables_locales[$ID.text].tipo
      elsif !@clase_actual.variables_instancia[$ID.text].nil?
        @p_operandos << @clase_actual.variables_instancia[$ID.text].direccion
        @p_tipos << @clase_actual.variables_instancia[$ID.text].tipo
      else
        raise "La variable -#{$ID.text}- no ha sido declarada en ningun metodo ni clase."
      end
    else
      if !@clase_actual.variables_instancia[$ID.text].nil?
        @p_operandos << @clase_actual.variables_instancia[$ID.text].direccion
        @p_tipos << @clase_actual.variables_instancia[$ID.text].tipo
      else
        raise "La variable -#{$ID.text}- no ha sido declarada."
      end
    end
  }
  ;

lado_der_asignacion
  :
  ( ( expresion | lectura )
  {
    # Regla 3 - Asignacion
    if @p_operadores.last == '='
      # Sacamos los ultimos dos tipos
      ultimos_dos_tipos = @p_tipos.last(2)
      # Revisamos en tabla semantica si son compatibles
      if(not @tabla.t['='][ultimos_dos_tipos.first][ultimos_dos_tipos.last].nil?)
        @p_tipos.pop(2)
        resultado_a_asignar = @p_operandos.pop
        # Sacamos la variable a la que se asignara el valor
        variable_asignada = @p_operandos.pop
        # Aqui se generaria el cuadruplo
        genera_cuadruplo(@p_operadores.pop, resultado_a_asignar, nil, variable_asignada)
        @p_operandos << variable_asignada
        @p_tipos << @tabla.t['='][ultimos_dos_tipos.first][ultimos_dos_tipos.last]
      else
        raise "Tipos incompatibles entre #{ultimos_dos_tipos.first} y #{ultimos_dos_tipos.last}"
      end

    end
  } 
  | ( 'nuevo' | 'nueva' ) CLASE_OB '(' ')'
  {
    # Asignacion de un nueva instancia de clase
    nombre_instancia = $CLASE_OB.text
    variable = @p_operandos.pop
    variable_tipo = @p_tipos.pop
    # Revisamos si la clase es igual al tipo de la variable
    if nombre_instancia == variable_tipo
      genera_cuadruplo('nuevo', nombre_instancia, nil, variable)
    else
      # Si la clase no es igual al tipo de la variable declarada, lanzamos error
      raise "Tipos incompatibles entre #{variable_tipo} y #{nombre_instancia}"
    end
  } )
	;

condicion
	:	'si?' '(' expresion ')' ':' 
  {
    # Regla 1 - Generacion Codigo estatuto condicional
    aux = @p_tipos.pop
    if aux != 'bol'
      raise "No se permite evaluar -#{aux}- en un estatuto condicional si?"
    else
      resultado = @p_operandos.pop
      genera_cuadruplo('gotof', resultado, nil, nil)
      @p_saltos << @cont-1
    end
  }
  estatuto* ( 'sino' 
  {
    # Regla 2
    genera_cuadruplo('goto', nil, nil, nil)
    salto_al_falso = @p_saltos.pop
    resuelve_salto_en_cuadruplo(salto_al_falso, @cont)
    @p_saltos << @cont-1
  } 
  estatuto* )? 'fin'
  {
    # Regla 3
    salto_al_resto = @p_saltos.pop
    resuelve_salto_en_cuadruplo(salto_al_resto, @cont)
  }
	;
	
escritura
	:	'imprime' '(' expresion
  {
    resultado = @p_operandos.pop
    @p_tipos.pop
    genera_cuadruplo('imp', nil, nil, resultado)
  }
  ( ',' expresion )* ')' ';'
	;
	
lectura	:	'lee' '(' ')'
  {
    resultado = @p_operandos.last
    tipo = @p_tipos.last
    dir = dir_temporal_disponible
    case tipo
    when 'ent'
      genera_cuadruplo('elee', nil, nil, dir)
    when 'flot'
      genera_cuadruplo('flee', nil, nil, dir)
    when 'string'
      genera_cuadruplo('slee', nil, nil, dir)
    end
    @p_operandos << dir
    @p_tipos << tipo
  }
	;

ciclo	:	mientras
	|	para
	;

mientras 
	:	'mientras' 
  {
    # Regla 1 - Estatuto While
    @p_saltos << @cont
  }
  '(' expresion ')' ':'
  {
    # Regla 2 - Estatuto While
    aux = @p_tipos.pop
    if aux != 'bol'
      raise "No se permite evaluar -#{aux}- en un estatuto condicional mientras"
    else
      resultado = @p_operandos.pop
      genera_cuadruplo('gotof', resultado, nil, nil)
      @p_saltos << @cont-1
    end
  }
  estatuto* 
  {
    # Regla 3 - Estatuto while
    salto_al_falso = @p_saltos.pop
    salto_a_mientras = @p_saltos.pop
    genera_cuadruplo('goto', nil, nil, salto_a_mientras)
    resuelve_salto_en_cuadruplo(salto_al_falso, @cont)
  }
  'fin' ;

para 	:	'para' '(' asignacion
  {
   # Regla 1 - Ciclo PARA
   @p_saltos << @cont
  }
  expresion ';'
  {
    # Regla 2 - Ciclo PARA
    aux = @p_tipos.pop
    if aux != 'bol'
      raise "No se permite evaluar -#{aux}- en un estatuto condicional PARA"
    else
      resultado = @p_operandos.pop
      genera_cuadruplo('gotof', resultado, nil, nil)
      @p_saltos << @cont-1
      @for_flag = true
    end
  }
  asignacion ')' ':'
  {
    # Regla 3 - Ciclo PARA
    @for_flag = false
  }
  estatuto* 
  {
    # Regla 4 - Ciclo PARA
    # Append de cuadruplos temporales de ciclo para a pila general de cuadruplos
    @p_cuadruplos += @p_temp_cuadruplos
    @cont += @p_temp_cuadruplos.size
    @p_temp_cuadruplos.clear

    # Resolver saltos del Ciclo PARA
    salto_al_falso = @p_saltos.pop
    salto_a_para = @p_saltos.pop
    genera_cuadruplo('goto', nil, nil, salto_a_para)
    resuelve_salto_en_cuadruplo(salto_al_falso, @cont)
  }
  'fin' ;

expresion
	:	e ( OPERADOR_LOGICO 
	{
	  # Regla 10 - Meter operador logico a pila de operadores
	  @p_operadores << $OPERADOR_LOGICO.text
	}
	e 
	{
	  # Regla 11 - Igual a regla 4
	  if(@p_operadores.last == '&&' or @p_operadores.last == '||')
      inserta_nuevo_resultado_en_pila_operandos(@p_operadores.last)
    end
	} )?
	;

e	:	exp ( OPERADOR_COMPARACION
  {
    # Regla 8 - Meter operador de comparacion a pila de operadores
    @p_operadores << $OPERADOR_COMPARACION.text
  } 
  exp 
  {
    # Regla 9 - Igual a regla 4 pero para operadores de comparacion 
    if(@p_operadores.last == '<' or @p_operadores.last == '>' or @p_operadores.last == '==' or @p_operadores.last == '!=')
      inserta_nuevo_resultado_en_pila_operandos(@p_operadores.last)
    end
  } )? 
	;

exp	:	termino ( OPERADOR_TERMINO 
    {
      # Regla 2 - Meter + o - a pila operadores
      @p_operadores << $OPERADOR_TERMINO.text
    }  
    exp 
    {
      # Regla 4
      if(@p_operadores.last == '+' or @p_operadores.last == '-')
        inserta_nuevo_resultado_en_pila_operandos(@p_operadores.last)
      end
    }  )* ;

termino :	factor ( OPERADOR_FACTOR 
    {
      # Regla 3 - Meter * o / a pila operadores
      @p_operadores << $OPERADOR_FACTOR.text
    } 
    termino
    {
      # Regla 4
      if(@p_operadores.last == '*' or @p_operadores.last == '/')
        inserta_nuevo_resultado_en_pila_operandos(@p_operadores.last)
      end
    }  )* ;

factor 	:	'(' 
  {
    # Regla 6 - Meter fondo falso a pila de operadores
    @p_operadores << '(' 
  } 
  expresion ')'
  {
    # Regla 7 - Sacar fondo falso de pila de operadores
    @p_operadores.pop
  } 
	|	var_cte 
	;

var_cte	:	
  ID
  {
  # Regla 1 - Metemos a pila de operandos la direccion de la variable. Metemos a pila de tipos el tipo de variable
  if !@metodo_actual.nil?
    if !@metodo_actual.variables_locales[$ID.text].nil?
      @p_operandos << @metodo_actual.variables_locales[$ID.text].direccion
      @p_tipos << @metodo_actual.variables_locales[$ID.text].tipo
    elsif !@clase_actual.variables_instancia[$ID.text].nil?
      @p_operandos << @clase_actual.variables_instancia[$ID.text].direccion
      @p_tipos << @clase_actual.variables_instancia[$ID.text].tipo
    else
      raise "La variable -#{$ID.text}- no ha sido declarada en ningun metodo ni clase."
    end
  else
    if !@clase_actual.variables_instancia[$ID.text].nil?
      @p_operandos << @clase_actual.variables_instancia[$ID.text].direccion
      @p_tipos << @clase_actual.variables_instancia[$ID.text].tipo
    else
      raise "La variable -#{$ID.text}- no ha sido declarada."
    end
  end
  }
	|	CTE_ENTERA 
    {
      # Regla 1 - Metemos a pila de operandos la direccion de la variable. Metemos a pila de tipos el tipo de variable
      # Si esta constante no habia sido indexada previamente, se crea y se genera el cuadruplo
      if(@constantes[$CTE_ENTERA.text].nil?)
        direccion = dir_constante_disponible
        cons = Constante.new($CTE_ENTERA.text, 'ent', direccion)
        @constantes[cons.valor] = cons
        genera_cuadruplo('iconst', cons.valor, nil, direccion)
      else
        # Si la constante ya habia sido indexada, se enviara la direccion de esa constante
        direccion = @constantes[$CTE_ENTERA.text].direccion
      end
      @p_operandos << direccion
      @p_tipos << 'ent'
    }
	|	CTE_FLOTANTE
	  {
	    # Regla 1 - Metemos a pila de operandos la direccion de la variable. Metemos a pila de tipos el tipo de variable
      # Si esta constante no habia sido indexada previamente, se crea y se genera el cuadruplo
      if(@constantes[$CTE_FLOTANTE.text].nil?)
        direccion = dir_constante_disponible
        cons = Constante.new($CTE_FLOTANTE.text, 'flot', direccion)
        @constantes[cons.valor] = cons
        genera_cuadruplo('fconst', cons.valor, nil, direccion)
      else
        # Si la constante ya habia sido indexada, se enviara la direccion de esa constante
        direccion = @constantes[$CTE_FLOTANTE.text].direccion
      end
      @p_operandos << direccion
      @p_tipos << 'flot'
	  }
	|	CTE_STRING
	  {
	    # Regla 1 - Metemos a pila de operandos la direccion de la variable. Metemos a pila de tipos el tipo de variable
      # Si esta constante no habia sido indexada previamente, se crea y se genera el cuadruplo
      if(@constantes[$CTE_STRING.text].nil?)
        direccion = dir_constante_disponible
        cons = Constante.new($CTE_STRING.text, 'string', direccion)
        @constantes[cons.valor] = cons
        genera_cuadruplo('sconst', cons.valor, nil, direccion)
      else
        # Si la constante ya habia sido indexada, se enviara la direccion de esa constante
        direccion = @constantes[$CTE_STRING.text].direccion
      end
      @p_operandos << direccion
      @p_tipos << 'string'
	  }
	|	CTE_BOLEANA
	  {
	    # Regla 1 - Metemos a pila de operandos la direccion de la variable. Metemos a pila de tipos el tipo de variable
      # Si esta constante no habia sido indexada previamente, se crea y se genera el cuadruplo
      if(@constantes[$CTE_BOLEANA.text].nil?)
        direccion = dir_constante_disponible
        cons = Constante.new($CTE_BOLEANA.text, 'bol', direccion)
        @constantes[cons.valor] = cons
        genera_cuadruplo('bconst', cons.valor, nil, direccion)
      else
        # Si la constante ya habia sido indexada, se enviara la direccion de esa constante
        direccion = @constantes[$CTE_BOLEANA.text].direccion
      end
      @p_operandos << direccion
      @p_tipos << 'bol'
	  }
	|	CTE_CHAR
	  {
	    # Regla 1 - Metemos a pila de operandos la direccion de la variable. Metemos a pila de tipos el tipo de variable
      # Si esta constante no habia sido indexada previamente, se crea y se genera el cuadruplo
      if(@constantes[$CTE_CHAR.text].nil?)
        direccion = dir_constante_disponible
        cons = Constante.new($CTE_CHAR.text, 'char', direccion)
        @constantes[cons.valor] = cons
        genera_cuadruplo('cconst', cons.valor, nil, direccion)
      else
        # Si la constante ya habia sido indexada, se enviara la direccion de esa constante
        direccion = @constantes[$CTE_CHAR.text].direccion
      end
      @p_operandos << direccion
      @p_tipos << 'char'
	  }
	| t =	invocacion 
  {
    dir = dir_constante_disponible
    genera_cuadruplo('get', nil, nil, dir)
    @p_operandos << dir
    @p_tipos << $t.tipo
  }
	|	'este' '.' ID 
  {
    unless @clase_actual.variables_instancia[$ID.text].nil?
      @p_operandos << @clase_actual.variables_instancia[$ID.text].direccion
      @p_tipos << @clase_actual.variables_instancia[$ID.text].tipo
    else
      raise "La variable #{$ID.text} no ha sido declarada dentro de la clase #{@clase_actual.nombre}"
    end
  }
	;

invocacion
  returns [tipo] :
    invocacion_de_clase ID
  {
    unless @clase_invocada.metodos_instancia[$ID.text].nil?
      @metodo_invocado = @clase_invocada.metodos_instancia[$ID.text]
      genera_cuadruplo('era', @clase_invocada.nombre, nil, @metodo_invocado.primer_cuadruplo)
    else
        raise "El metodo #{$ID.text} no existe para la clase #{@clase_invocada.nombre}"
    end
  }
  '(' argumentos? ')'
  {
    genera_cuadruplo('gosub', @instancia_invocada.direccion, nil, @metodo_invocado.primer_cuadruplo)
    $tipo = @metodo_invocado.tipo_de_retorno
    @instancia_invocada = nil
    @metodo_invocado = nil
    @clase_invocada = nil
  }
	;

invocacion_de_clase
  : ( (t = 'este' | t = ID) '.')?
  {
    if($t.nil? || $t.text == 'este')
      # Si la invocacion no recibio una instancia o bien indica es una llamada dentro de la clase actual
      @clase_invocada = @clase_actual
      @instancia_invocada = @instancia_actual
    else
      # Si la invocacion recibio una instancia, se busca en el metodo o en la clase donde se encuentra
      puts "Instancia invocada - #{@instancia_invocada.nombre}"
      if @instancia_invocada.nil?
        raise "La variable #{$ID.text} no ha sido declarada para la clase #{@clase_actual.nombre}"
      end
      # Buscamos la clase a la que pertenece la instancia invocada
      @clase_invocada = @clases[@instancia_invocada.tipo]
    end
  }
  ;

argumentos
  : expresion 
  {
    @arg_cont = 0
    argumento = @p_operandos.pop
    arg_tipo = @p_tipos.pop
    puts "Argumentos - #{argumento} - tipo: #{arg_tipo}"
    if @metodo_invocado.cantidad_de_parametros <= @arg_cont
      raise ArgumentError, "El metodo #{@metodo_invocado.nombre} debe contener #{@metodo_invocado.cantidad_de_parametros} argumentos."
    end
    param_tipo = @metodo_invocado.parametros.values[@arg_cont].tipo
    if arg_tipo != param_tipo
      raise ArgumentError, "El argumento #{@arg_cont+1} del metodo #{@metodo_invocado.nombre} espera un tipo #{param_tipo}"
    end
    @arg_cont = @arg_cont + 1
    genera_cuadruplo('param', argumento, nil, @arg_cont)
  }
  ( ',' expresion
  {
    argumento = @p_operandos.pop
    arg_tipo = @p_tipos.pop
    if @metodo_invocado.cantidad_de_parametros <= @arg_cont
      raise ArgumentError, "El metodo #{@metodo_invocado.nombre} debe contener #{@metodo_invocado.cantidad_de_parametros} argumentos."
    end
    param_tipo = @metodo_invocado.parametros.values[@arg_cont].tipo
    if arg_tipo != param_tipo
      raise ArgumentError, "El argumento #{@arg_cont+1} del metodo #{@metodo_invocado.nombre} espera un tipo #{param_tipo}"
    end
    @arg_cont = @arg_cont + 1
    genera_cuadruplo('param', argumento, nil, @arg_cont)
  } 
  )*
  {
    if @metodo_invocado.cantidad_de_parametros != @arg_cont
      raise ArgumentError, "El metodo #{@metodo_invocado.nombre} debe contener #{@metodo_invocado.cantidad_de_parametros} argumentos."
    end
  # TO-DO: Eliminar la reinicializacion a 0
  @arg_cont = 0
  }
  ;


// TOKENS del lexico
ID:  LETRA_MIN  ( LETRA_MIN | LETRA_MAY | '_' | DIGITO )*;

CTE_ENTERA: DIGITO+;

CTE_FLOTANTE: CTE_ENTERA '.' CTE_ENTERA (EXPONENTE)?;

CTE_STRING
    :  '"' ( ESC_SEQ | ~('\\'|'"') )* '"'
    ; 
    
CTE_CHAR:  '\'' ( ESC_SEQ | ~('\''|'\\') ) '\''
    ;

CTE_BOLEANA: ( 'SI' | 'NO' );

CLASE_OB: LETRA_MAY ( LETRA_MAY | LETRA_MIN | DIGITO )*;

COMENTARIOS
    :   '#' ( options {greedy=false;} : . )* '#' {$channel=HIDDEN;}
    ;

WHITESPACE:   ( ' ' | '\t' | '\r' | '\n') {$channel=HIDDEN;} ;

// SEPARADOR: ( ':' | '(' | ')' | ';' | WHITESPACE | ',' );
OPERADOR_TERMINO
	:	'+'
	|	'-'
	;

OPERADOR_FACTOR 
	:	'*'
	|	'/'
	;

OPERADOR_LOGICO
	:	'&&'
  | '||'
	;

OPERADOR_COMPARACION: '==' | '<' | '>' | '!=';

fragment
LETRA_MAY : ( 'A' .. 'Z' );

fragment
LETRA_MIN : ( 'a' .. 'z' );

fragment
DIGITO  : ( '0' .. '9' );

fragment
EXPONENTE : ('e'|'E') ('+'|'-')? ('0'..'9')+ ;


fragment
HEX_DIGIT : ('0'..'9'|'a'..'f'|'A'..'F') ;

fragment
ESC_SEQ
    :   '\\' ('b'|'t'|'n'|'f'|'r'|'\"'|'\''|'\\')
    |   UNICODE_ESC
    |   OCTAL_ESC
    ;

fragment
OCTAL_ESC
    :   '\\' ('0'..'3') ('0'..'7') ('0'..'7')
    |   '\\' ('0'..'7') ('0'..'7')
    |   '\\' ('0'..'7')
    ;

fragment
UNICODE_ESC
    :   '\\' 'u' HEX_DIGIT HEX_DIGIT HEX_DIGIT HEX_DIGIT
    ;
