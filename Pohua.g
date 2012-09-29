grammar Pohua;

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
	|	ID invocacion
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
	|	OPERADOR_TERMINO? var_cte
	;

var_cte	: 	( ID
	|	CTE_ENTERA
	|	CTE_FLOTANTE
	|	CTE_STRING
	|	CTE_BOLEANA
	|	CTE_CHAR
	|	'este'
	|	'nuevo' CLASE_OB ) invocacion?
	;

invocacion
	:	'.' ID '(' ( expresion ( ',' expresion )* )? ')' invocacion? ';'
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
