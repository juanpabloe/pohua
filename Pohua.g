grammar Pohua;

options { language = Ruby; }

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

  def initialize(nombre, tipo_de_retorno)
    @nombre = nombre
    @tipo_de_retorno = tipo_de_retorno  # De la clase Clase
    @variables_locales = Hash.new # Hash con objetos de la clase Variable
    @parametros = Hash.new # Hash con objetos de la clase Variable
  end

end

class Clase
  attr_accessor :nombre, :variables_instancia, :metodos_instancia
  # To-do: Agregar un atributo para la clase padre en el caso de herencia

  def initialize(nombre)
    @nombre = nombre
    @variables_instancia = Hash.new # Hash con objetos de la clase Variable
    @metodos_instancia = Hash.new # Hash con objetos de la clase Metodo
  end

end

}

@parser::init {
  p_operadores = [] #Pila de operadores en la generacion de cuadruplos
  p_operandos = [] #Pila de operando en la generacion de cuadruplos
  p_tipos = [] #Tipos de los operandos
  p_saltos = [] #Pila de saltos

  @clase_actual = nil
  @metodo_actual = nil

  @clases = {}  # Hash para indexar las clases detectadas en el programa
}


programa 
	:	clase*  clase_principal 
	;

clase	:	'clase' CLASE_OB ('extiende' CLASE_OB)? ':' dec_variable* metodo* 'fin';

clase_principal
	:	'clase' 'Principal' ':' met_principal metodo* 'fin'
	;
	
met_principal
	:	'metodo' 'vacuo' 'principal' ':' bloque* 'fin'
	;

bloque	:	dec_variable
	|	estatuto
	;
	
dec_variable
	:	tipo ID ';'
	;

metodo	:	'metodo' (met_tipado | met_vacuo) ;

met_tipado
	:	tipo ID parametro? ':' bloque* 'regresa' expresion 'fin'
	;
	
met_vacuo
	:	'vacuo' ID parametro? ':' bloque* 'fin'
	;
	
tipo	:	'ent'
	|	'flot'
	|	'string'
	|	'bol'
	|	'char'
	|	CLASE_OB
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
