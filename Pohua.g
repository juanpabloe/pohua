lexer grammar Pohua;

options { language = Ruby; }

/*------------------------------------------------------------------
 * PARSER RULES
 *------------------------------------------------------------------*/
 
 
/*------------------------------------------------------------------
 * LEXER RULES
 *------------------------------------------------------------------*/

ID: ( LETRA_MIN ) ( LETRA_MIN | LETRA_MAY | '_' | DIGITO )*;

VARIABLE: '@' ID ;

CTE_ENTERA: DIGITO+;

CTE_FLOTANTE: CTE_ENTERA '.' CTE_ENTERA (EXPONENTE)?;

CTE_STRING: '"' ( CUALQUIERA_DENTRO_STRING_O_COMETARIO | '\"')* '"'; 

/* CTE_BOLEANA: ( 'SI' | 'NO' ); */

/* CTE_CHAR: Pendiente revisar constantes char */

CLASES_OB: LETRA_MAY ( LETRA_MAY | LETRA_MIN | DIGITO )*;

COMENTARIOS: '#' ( CUALQUIERA_DENTRO_STRING_O_COMETARIO ) '#';

WHITESPACE:   ( ' ' | '\t' | '\r' | '\n') {$channel=HIDDEN;} ;

SEPARADORES: ( ':' | '(' | ')' | ';' | WHITESPACE | ',' );

OPERADORES_FACTOR: '*' | '/';

OPERADORES_TERMINO: '+'  | '-';

OPERADORES_COMPARACION: '==' | '<' | '>' | '&&' | '||' | '!=';

OPERADORES_ASIGNACION: ( '=' );

fragment
LETRA_MAY : ( 'A' .. 'Z' );

fragment
LETRA_MIN : ( 'a' .. 'z' );

fragment
DIGITO  : ( '0' .. '9' );

fragment
EXPONENTE : ('e'|'E') ('+'|'-')? ('0'..'9')+ ;

fragment
CUALQUIERA_DENTRO_STRING_O_COMETARIO: ( DIGITO | LETRA_MIN | LETRA_MAY | OPERADORES_ASIGNACION |OPERADORES_COMPARACION | OPERADORES_FACTOR | OPERADORES_TERMINO | SEPARADORES );
