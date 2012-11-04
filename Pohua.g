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

  DIR_INICIAL = 2000
  DIR_FINAL = 2500

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

end

class Clase
  attr_accessor :nombre, :variables_instancia, :metodos_instancia, :sig_direccion, 
                :primer_cuadruplo

  # To-do: Agregar un atributo para la clase padre en el caso de herencia

  DIR_INICIAL = 1000
  DIR_FINAL = 1500

  def initialize(nombre)
    @nombre = nombre
    @variables_instancia = Hash.new      # Hash con objetos de la clase Variable
    @metodos_instancia = Hash.new        # Hash con objetos de la clase Metodo
    @sig_direccion = DIR_INICIAL         # Se ubica en la primer direccion disponible para variables
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
    if @estatuto_for
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
  :	'clase' c1 = CLASE_OB ('extiende' c2 = CLASE_OB)? 
  {
    @clases[$c1.text] = Clase.new($c1.text)
    @clase_actual = @clases[$c1.text]
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
		':' met_principal metodo* 'fin'
  {
    @clase_actual = nil
    # El cuadruplo halt indica el fin del programa
    genera_cuadruplo('halt', nil, nil, nil)
  }
	;
	
met_principal
	:	'metodo' 'vacuo' 'principal' 
    {
      @clase_actual.metodos_instancia['principal'] = Metodo.new('principal', 'vacuo', @clase_actual)
      @metodo_actual = @clase_actual.metodos_instancia['principal']
      @metodo_actual.primer_cuadruplo = @cont
    }
    ':' bloque* 'fin'
    {
      @metodo_actual = nil
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
	: t =	tipo ID parametro? 
  {
    @clase_actual.metodos_instancia[$ID.text] = Metodo.new($ID.text, $t.valor, @clase_actual)
    @metodo_actual = @clase_actual.metodos_instancia[$ID.text]
    @metodo_actual.primer_cuadruplo = @cont
  }
  ':' bloque* 'regresa' expresion 'fin'
  {
    @metodo_actual = nil
  }
	;
	
met_vacuo
	:	'vacuo' ID parametro? 
  {
    @clase_actual.metodos_instancia[$ID.text] = Metodo.new($ID.text, 'vacuo', @clase_actual)
    @metodo_actual = @clase_actual.metodos_instancia[$ID.text]
    @metodo_actual.primer_cuadruplo = @cont
  }
  ':' bloque* 'fin' 
  {
    @metodo_actual = nil
  }
	;
	
tipo
  returns [valor]:
  // No estamos seguros que el .text regrese el texto de CLASE_OB
  t = ( 'ent'	|	'flot' |	'string' |	'bol' |	'char' |	CLASE_OB ) { $valor = $t.text }
	;
	
parametro
	:	'(' tipo ID ( ',' tipo ID)* ')'
	;
	
estatuto
	:	asignacion
	|	condicion
	|	escritura
	|	ciclo
	|	invocacion ';'
	;
	
asignacion
	: 	('este' '.' ID) // Pendiente resolver asignacion del tipo este.atributo
  | (ID '.' ID) // Pendiente resolver el tipo objeto.atributo
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
  '='
  {
    # Regla 2 - Metemos '=' a pila operadores
    @p_operadores << '='
  } 
  ( expresion | lectura )
  {
    # Regla 3 - Asignacion
    while @p_operadores.last == '=' do
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
  } ( '=' ( expresion | lectura ) )*  ';'
  {
    #FIX-ME: Revisar si tenemos que sacar este token de la pila de operandos
    @p_operandos.pop
    @p_tipos.pop
  }
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
	|	invocacion
	|	'nuevo' CLASE_OB
	|	ID '.' ID
	|	'este' '.' ID
	;

invocacion
	:	('este' | ID) '.' ID '(' ( expresion ( ',' expresion )* )? ')' 
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
