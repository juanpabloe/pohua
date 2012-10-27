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
    @direccion = nil
    @tipo = tipo
  end

end

class Metodo
  attr_accessor :nombre, :variables_locales, :parametros, :tipo_de_retorno

  def initialize(nombre, tipo_de_retorno = 'vacuo', clase_envase = nil)
    @nombre = nombre
    @tipo_de_retorno = tipo_de_retorno  # Tipo como Ent, Flot, Vacuo, Boolean.
    @clase_envase = clase_envase        # Clase en la que se encuentra el metodo
    @variables_locales = Hash.new       # Hash con objetos de la clase Variable
    @parametros = Hash.new              # Hash con objetos de la clase Variable
  end

end

class Clase
  attr_accessor :nombre, :variables_instancia, :metodos_instancia
  # To-do: Agregar un atributo para la clase padre en el caso de herencia

  def initialize(nombre)
    @nombre = nombre
    @variables_instancia = Hash.new      # Hash con objetos de la clase Variable
    @metodos_instancia = Hash.new        # Hash con objetos de la clase Metodo
  end

end

}

@parser::init {
  @p_operadores = []     #Pila de operadores en la generacion de cuadruplos
  @p_operandos = []      #Pila de operando en la generacion de cuadruplos
  @p_tipos = []          #Tipos de los operandos
  @p_saltos = []         #Pila de saltos

  @p_cuadruplos = []    # Pila de cuadruplos final
  @cont = 0             # Contador de cuadruplos

  @clase_actual = nil   # Variable que apuntara a la clase actual durante el parseo
  @metodo_actual = nil  # Variable que apuntara al metodo actual durante el parseo

  @clases = {}          # Hash para indexar las clases detectadas en el programa

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
    @p_cuadruplos << cuad
    @cont = @cont + 1
    puts "#{@cont} - #{cuad.to_s}"
  end

  # Metodo que inserta el resultado generado por el cuadruplo en la pila de operandos y su tipo en la PTipos
  # Utilizado en la etapa de Generacion de Codigo
  def inserta_nuevo_resultado_en_pila_operandos(operador)
    ultimos_dos_tipos = @p_tipos.last(2)
    if(not @tabla.t[operador][ultimos_dos_tipos.first][ultimos_dos_tipos.last].nil?)
      @p_tipos.pop(2)
      # Aqui se generaria el cuadruplo
      dir = dir_temporal_disponible
      genera_cuadruplo(@p_operadores.pop, @p_operandos.pop, @p_operandos.pop, dir)
      @p_operandos << dir
      @p_tipos << @tabla.t[operador][ultimos_dos_tipos.first][ultimos_dos_tipos.last]
    else
      raise "Tipos incompatibles entre #{ultimos_dos_tipos.first} y #{ultimos_dos_tipos.last}"
    end
  end

  def resuelve_salto_en_cuadruplo(posicion_cuadruplo, valor)
    # Busca el cuadruplo en la pila de cuadruplos, 
    # y en la cuarta posicion del cuadruplo le asigna el valor pendiente
    @p_cuadruplos[posicion_cuadruplo][3] = valor
  end
}


programa 
	:	clase*  clase_principal 
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
  }
	;
	
met_principal
	:	'metodo' 'vacuo' 'principal' 
    {
      @clase_actual.metodos_instancia['principal'] = Metodo.new('principal', 'vacuo', @clase_actual)
      @metodo_actual = @clase_actual.metodos_instancia['principal']
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
        # Si la variable se declara dentro de un metodo. TO-do: pendiente enviar direcciones de la variable
        @metodo_actual.variables_locales[$ID.text] = Variable.new($ID.text, $t.valor)
      else
        # Si la variable se declara dentro de una clase.
        @clase_actual.variables_instancia[$ID.text] = Variable.new($ID.text, $t.valor)
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
        genera_cuadruplo(@p_operadores.pop, resultado_a_asignar, '', variable_asignada)
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
	:	'imprime' '(' expresion ( ',' expresion )* ')' ';'
	;
	
lectura	:	'lee' '(' ')' 
	;

ciclo	:	mientras
	|	para
	;

mientras 
	:	'mientras' '(' expresion ')' ':' estatuto* 'fin' ;

para 	:	'para' '(' asignacion ';' expresion ';' expresion ';' ')' estatuto* 'fin' ;

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
      direccion = dir_constante_disponible
      @p_operandos << direccion
      @p_tipos << 'ent'
    }
	|	CTE_FLOTANTE
	  {
	    # Regla 1 - Metemos a pila de operandos la direccion de la variable. Metemos a pila de tipos el tipo de variable
      direccion = dir_constante_disponible
      @p_operandos << direccion
      @p_tipos << 'flot'
	  }
	|	CTE_STRING
	  {
	    # Regla 1 - Metemos a pila de operandos la direccion de la variable. Metemos a pila de tipos el tipo de variable
      direccion = dir_constante_disponible
      @p_operandos << direccion
      @p_tipos << 'string'
	  }
	|	CTE_BOLEANA
	  {
	    # Regla 1 - Metemos a pila de operandos la direccion de la variable. Metemos a pila de tipos el tipo de variable
      direccion = dir_constante_disponible
      @p_operandos << direccion
      @p_tipos << 'bol'
	  }
	|	CTE_CHAR
	  {
	    # Regla 1 - Metemos a pila de operandos la direccion de la variable. Metemos a pila de tipos el tipo de variable
      direccion = dir_constante_disponible
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
