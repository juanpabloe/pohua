// Pohua - Lenguaje de programación
// Abigail Sosa Hdz.
// Juan Pablo Escobar L.
// Septiembre 2012

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
  p_operadores = []     #Pila de operadores en la generacion de cuadruplos
  p_operandos = []      #Pila de operando en la generacion de cuadruplos
  p_tipos = []          #Tipos de los operandos
  p_saltos = []         #Pila de saltos

  @clase_actual = nil   # Variable que apuntara a la clase actual durante el parseo
  @metodo_actual = nil  # Variable que apuntara al metodo actual durante el parseo

  @clases = {}          # Hash para indexar las clases detectadas en el programa

  @tabla = TablaSemantica.new   # Creamos nuestra tabla semantica. Para acceder a los valores usa @tabla.t

}


programa 
	:	clase*  clase_principal 
	;

clase	
  :	'clase' c1 = CLASE_OB ('extiende' c2 = CLASE_OB)? 
  {
    @clases[$c1.text] = Clase.new($c1.text)
    @clase_actual = @clases[$c1.text]
    puts "Se guardo clase #{$c1.text}"
  }
  ':' dec_variable* metodo* 'fin'
  {
    @clase_actual = nil
    puts "Final de clase"
  }
  ;

clase_principal
	:	'clase' 'Principal'
  {
    @clases['Principal'] = Clase.new('Principal')
    @clase_actual = @clases['Principal']
    puts "Se guardo clase Principal"
  }
		':' met_principal metodo* 'fin'
  {
    @clase_actual = nil
    puts "Final de clase Principal"
  }
	;
	
met_principal
	:	'metodo' 'vacuo' 'principal' 
    {
      @clase_actual.metodos_instancia['principal'] = Metodo.new('principal', 'vacuo', @clase_actual)
      @metodo_actual = @clase_actual.metodos_instancia['principal']
      puts "Se guardo metodo principal"
    }
    ':' bloque* 'fin'
    {
      @metodo_actual = nil
      puts "Final de metodo principal"
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
        puts "Se guardo variable #{$ID.text} de tipo -#{$t.valor}- en metodo #{@metodo_actual.nombre}"
      else
        # Si la variable se declara dentro de una clase.
        @clase_actual.variables_instancia[$ID.text] = Variable.new($ID.text, $t.valor)
        puts "Se guardo variable #{$ID.text} de tipo -#{$t.valor}- en clase #{@clase_actual.nombre}"
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
    puts "Se guardo metodo #{$ID.text} de tipo -#{$t.valor}- en clase #{@clase_actual.nombre}"
  }
  ':' bloque* 'regresa' expresion 'fin'
  {
    puts "Fin de metodo #{@metodo_actual.nombre}"
    @metodo_actual = nil
  }
	;
	
met_vacuo
	:	'vacuo' ID parametro? 
  {
    @clase_actual.metodos_instancia[$ID.text] = Metodo.new($ID.text, 'vacuo', @clase_actual)
    @metodo_actual = @clase_actual.metodos_instancia[$ID.text]
    puts "Se guardo metodo #{$ID.text} de tipo -vacuo- en clase #{@clase_actual.nombre}"
  }
  ':' bloque* 'fin' 
  {
    puts "Fin de metodo #{@metodo_actual.nombre}"
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
	|	invocacion
	;
	
asignacion
	: 	('este' | ID) ( '.' ID)? '='  ( expresion | lectura ) ';'
	;
condicion
	:	'si?' '(' expresion ')' ':' estatuto* ( 'sino' estatuto )? 'fin'
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
	:	'mientras' '(' expresion ')' ':' estatuto 'fin' ;

para 	:	'para' '(' asignacion ';' expresion ';' expresion ';' ')' estatuto 'fin' ;

expresion
	:	e ( OPERADOR_LOGICO e )?
	;

e	:	exp ( OPERADOR_COMPARACION exp )? 
	;

exp	:	termino ( OPERADOR_TERMINO exp )* ;

termino :	factor ( OPERADOR_FACTOR termino )* ;

factor 	:	'(' expresion ')' 
	|	var_cte
	;

var_cte	: 	ID
	|	CTE_ENTERA
	|	CTE_FLOTANTE
	|	CTE_STRING
	|	CTE_BOLEANA
	|	CTE_CHAR
	|	invocacion
	|	'nuevo' CLASE_OB
	|	ID '.' ID
	|	'este' '.' ID
	;

invocacion
	:	('este' | ID) '.' ID '(' ( expresion ( ',' expresion )* )? ')' ';'
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
	|	'!='
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
