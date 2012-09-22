#!/usr/bin/env ruby
#
# Pohua.g
# --
# Generated using ANTLR version: 3.2.1-SNAPSHOT Jul 31, 2010 19:34:52
# Ruby runtime library version: 1.8.11
# Input grammar file: Pohua.g
# Generated at: 2012-09-22 17:22:05
# 

# ~~~> start load path setup
this_directory = File.expand_path( File.dirname( __FILE__ ) )
$LOAD_PATH.unshift( this_directory ) unless $LOAD_PATH.include?( this_directory )

antlr_load_failed = proc do
  load_path = $LOAD_PATH.map { |dir| '  - ' << dir }.join( $/ )
  raise LoadError, <<-END.strip!
  
Failed to load the ANTLR3 runtime library (version 1.8.11):

Ensure the library has been installed on your system and is available
on the load path. If rubygems is available on your system, this can
be done with the command:
  
  gem install antlr3

Current load path:
#{ load_path }

  END
end

defined?( ANTLR3 ) or begin
  
  # 1: try to load the ruby antlr3 runtime library from the system path
  require 'antlr3'
  
rescue LoadError
  
  # 2: try to load rubygems if it isn't already loaded
  defined?( Gem ) or begin
    require 'rubygems'
  rescue LoadError
    antlr_load_failed.call
  end
  
  # 3: try to activate the antlr3 gem
  begin
    Gem.activate( 'antlr3', '~> 1.8.11' )
  rescue Gem::LoadError
    antlr_load_failed.call
  end
  
  require 'antlr3'
  
end
# <~~~ end load path setup


module Pohua
  # TokenData defines all of the token type integer values
  # as constants, which will be included in all 
  # ANTLR-generated recognizers.
  const_defined?( :TokenData ) or TokenData = ANTLR3::TokenScheme.new

  module TokenData

    # define the token constants
    define_tokens( :OPERADORES_TERMINO => 19, :OPERADORES_ASIGNACION => 21, 
                   :DIGITO => 6, :CTE_ENTERA => 9, :LETRA_MIN => 4, :EXPONENTE => 10, 
                   :COMENTARIOS => 15, :WHITESPACE => 16, :CTE_FLOTANTE => 11, 
                   :ID => 7, :EOF => -1, :OPERADORES_COMPARACION => 20, 
                   :CLASES_OB => 14, :SEPARADORES => 17, :CTE_STRING => 13, 
                   :VARIABLE => 8, :LETRA_MAY => 5, :OPERADORES_FACTOR => 18, 
                   :CUALQUIERA_DENTRO_STRING_O_COMETARIO => 12 )
    
  end


  class Lexer < ANTLR3::Lexer
    @grammar_home = Pohua
    include TokenData

    
    begin
      generated_using( "Pohua.g", "3.2.1-SNAPSHOT Jul 31, 2010 19:34:52", "1.8.11" )
    rescue NoMethodError => error
      # ignore
    end
    
    RULE_NAMES   = [ "ID", "VARIABLE", "CTE_ENTERA", "CTE_FLOTANTE", "CTE_STRING", 
                     "CLASES_OB", "COMENTARIOS", "WHITESPACE", "SEPARADORES", 
                     "OPERADORES_FACTOR", "OPERADORES_TERMINO", "OPERADORES_COMPARACION", 
                     "OPERADORES_ASIGNACION", "LETRA_MAY", "LETRA_MIN", 
                     "DIGITO", "EXPONENTE", "CUALQUIERA_DENTRO_STRING_O_COMETARIO" ].freeze
    RULE_METHODS = [ :id!, :variable!, :cte_entera!, :cte_flotante!, :cte_string!, 
                     :clases_ob!, :comentarios!, :whitespace!, :separadores!, 
                     :operadores_factor!, :operadores_termino!, :operadores_comparacion!, 
                     :operadores_asignacion!, :letra_may!, :letra_min!, 
                     :digito!, :exponente!, :cualquiera_dentro_string_o_cometario! ].freeze

    
    def initialize( input=nil, options = {} )
      super( input, options )

    end
    
    
    # - - - - - - - - - - - lexer rules - - - - - - - - - - - -
    # lexer rule id! (ID)
    # (in Pohua.g)
    def id!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 1 )

      type = ID
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 14:5: ( LETRA_MIN ) ( LETRA_MIN | LETRA_MAY | '_' | DIGITO )*
      # at line 14:5: ( LETRA_MIN )
      # at line 14:7: LETRA_MIN
      letra_min!

      # at line 14:19: ( LETRA_MIN | LETRA_MAY | '_' | DIGITO )*
      while true # decision 1
        alt_1 = 5
        case look_1 = @input.peek( 1 )
        when 0x61, 0x62, 0x63, 0x64, 0x65, 0x66, 0x67, 0x68, 0x69, 0x6a, 0x6b, 0x6c, 0x6d, 0x6e, 0x6f, 0x70, 0x71, 0x72, 0x73, 0x74, 0x75, 0x76, 0x77, 0x78, 0x79, 0x7a then alt_1 = 1
        when 0x41, 0x42, 0x43, 0x44, 0x45, 0x46, 0x47, 0x48, 0x49, 0x4a, 0x4b, 0x4c, 0x4d, 0x4e, 0x4f, 0x50, 0x51, 0x52, 0x53, 0x54, 0x55, 0x56, 0x57, 0x58, 0x59, 0x5a then alt_1 = 2
        when 0x5f then alt_1 = 3
        when 0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x38, 0x39 then alt_1 = 4
        end
        case alt_1
        when 1
          # at line 14:21: LETRA_MIN
          letra_min!

        when 2
          # at line 14:33: LETRA_MAY
          letra_may!

        when 3
          # at line 14:45: '_'
          match( 0x5f )

        when 4
          # at line 14:51: DIGITO
          digito!

        else
          break # out of loop for decision 1
        end
      end # loop for decision 1

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 1 )

    end

    # lexer rule variable! (VARIABLE)
    # (in Pohua.g)
    def variable!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 2 )

      type = VARIABLE
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 16:11: '@' ID
      match( 0x40 )
      id!

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 2 )

    end

    # lexer rule cte_entera! (CTE_ENTERA)
    # (in Pohua.g)
    def cte_entera!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 3 )

      type = CTE_ENTERA
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 18:13: ( DIGITO )+
      # at file 18:13: ( DIGITO )+
      match_count_2 = 0
      while true
        alt_2 = 2
        look_2_0 = @input.peek( 1 )

        if ( look_2_0.between?( 0x30, 0x39 ) )
          alt_2 = 1

        end
        case alt_2
        when 1
          # at line 18:13: DIGITO
          digito!

        else
          match_count_2 > 0 and break
          eee = EarlyExit(2)


          raise eee
        end
        match_count_2 += 1
      end


      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 3 )

    end

    # lexer rule cte_flotante! (CTE_FLOTANTE)
    # (in Pohua.g)
    def cte_flotante!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 4 )

      type = CTE_FLOTANTE
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 20:15: CTE_ENTERA '.' CTE_ENTERA ( EXPONENTE )?
      cte_entera!
      match( 0x2e )
      cte_entera!
      # at line 20:41: ( EXPONENTE )?
      alt_3 = 2
      look_3_0 = @input.peek( 1 )

      if ( look_3_0 == 0x45 || look_3_0 == 0x65 )
        alt_3 = 1
      end
      case alt_3
      when 1
        # at line 20:42: EXPONENTE
        exponente!

      end

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 4 )

    end

    # lexer rule cte_string! (CTE_STRING)
    # (in Pohua.g)
    def cte_string!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 5 )

      type = CTE_STRING
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 22:13: '\"' ( CUALQUIERA_DENTRO_STRING_O_COMETARIO | '\\\"' )* '\"'
      match( 0x22 )
      # at line 22:17: ( CUALQUIERA_DENTRO_STRING_O_COMETARIO | '\\\"' )*
      while true # decision 4
        alt_4 = 3
        look_4_0 = @input.peek( 1 )

        if ( look_4_0 == 0x22 )
          look_4_1 = @input.peek( 2 )

          if ( look_4_1.between?( 0x9, 0xa ) || look_4_1 == 0xd || look_4_1.between?( 0x20, 0x22 ) || look_4_1 == 0x26 || look_4_1.between?( 0x28, 0x2d ) || look_4_1.between?( 0x2f, 0x3e ) || look_4_1.between?( 0x41, 0x5a ) || look_4_1.between?( 0x61, 0x7a ) || look_4_1 == 0x7c )
            alt_4 = 2

          end
        elsif ( look_4_0.between?( 0x9, 0xa ) || look_4_0 == 0xd || look_4_0.between?( 0x20, 0x21 ) || look_4_0 == 0x26 || look_4_0.between?( 0x28, 0x2d ) || look_4_0.between?( 0x2f, 0x3e ) || look_4_0.between?( 0x41, 0x5a ) || look_4_0.between?( 0x61, 0x7a ) || look_4_0 == 0x7c )
          alt_4 = 1

        end
        case alt_4
        when 1
          # at line 22:19: CUALQUIERA_DENTRO_STRING_O_COMETARIO
          cualquiera_dentro_string_o_cometario!

        when 2
          # at line 22:58: '\\\"'
          match( 0x22 )

        else
          break # out of loop for decision 4
        end
      end # loop for decision 4
      match( 0x22 )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 5 )

    end

    # lexer rule clases_ob! (CLASES_OB)
    # (in Pohua.g)
    def clases_ob!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 6 )

      type = CLASES_OB
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 28:12: LETRA_MAY ( LETRA_MAY | LETRA_MIN | DIGITO )*
      letra_may!
      # at line 28:22: ( LETRA_MAY | LETRA_MIN | DIGITO )*
      while true # decision 5
        alt_5 = 4
        case look_5 = @input.peek( 1 )
        when 0x41, 0x42, 0x43, 0x44, 0x45, 0x46, 0x47, 0x48, 0x49, 0x4a, 0x4b, 0x4c, 0x4d, 0x4e, 0x4f, 0x50, 0x51, 0x52, 0x53, 0x54, 0x55, 0x56, 0x57, 0x58, 0x59, 0x5a then alt_5 = 1
        when 0x61, 0x62, 0x63, 0x64, 0x65, 0x66, 0x67, 0x68, 0x69, 0x6a, 0x6b, 0x6c, 0x6d, 0x6e, 0x6f, 0x70, 0x71, 0x72, 0x73, 0x74, 0x75, 0x76, 0x77, 0x78, 0x79, 0x7a then alt_5 = 2
        when 0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x38, 0x39 then alt_5 = 3
        end
        case alt_5
        when 1
          # at line 28:24: LETRA_MAY
          letra_may!

        when 2
          # at line 28:36: LETRA_MIN
          letra_min!

        when 3
          # at line 28:48: DIGITO
          digito!

        else
          break # out of loop for decision 5
        end
      end # loop for decision 5

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 6 )

    end

    # lexer rule comentarios! (COMENTARIOS)
    # (in Pohua.g)
    def comentarios!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 7 )

      type = COMENTARIOS
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 30:14: '#' ( CUALQUIERA_DENTRO_STRING_O_COMETARIO ) '#'
      match( 0x23 )
      # at line 30:18: ( CUALQUIERA_DENTRO_STRING_O_COMETARIO )
      # at line 30:20: CUALQUIERA_DENTRO_STRING_O_COMETARIO
      cualquiera_dentro_string_o_cometario!

      match( 0x23 )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 7 )

    end

    # lexer rule whitespace! (WHITESPACE)
    # (in Pohua.g)
    def whitespace!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 8 )

      type = WHITESPACE
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 32:15: ( ' ' | '\\t' | '\\r' | '\\n' )
      if @input.peek( 1 ).between?( 0x9, 0xa ) || @input.peek(1) == 0xd || @input.peek(1) == 0x20
        @input.consume
      else
        mse = MismatchedSet( nil )
        recover mse
        raise mse
      end


      # --> action
      channel=HIDDEN;
      # <-- action

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 8 )

    end

    # lexer rule separadores! (SEPARADORES)
    # (in Pohua.g)
    def separadores!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 9 )

      type = SEPARADORES
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 34:14: ( ':' | '(' | ')' | ';' | WHITESPACE | ',' )
      # at line 34:14: ( ':' | '(' | ')' | ';' | WHITESPACE | ',' )
      alt_6 = 6
      case look_6 = @input.peek( 1 )
      when 0x3a then alt_6 = 1
      when 0x28 then alt_6 = 2
      when 0x29 then alt_6 = 3
      when 0x3b then alt_6 = 4
      when 0x9, 0xa, 0xd, 0x20 then alt_6 = 5
      when 0x2c then alt_6 = 6
      else
        raise NoViableAlternative( "", 6, 0 )
      end
      case alt_6
      when 1
        # at line 34:16: ':'
        match( 0x3a )

      when 2
        # at line 34:22: '('
        match( 0x28 )

      when 3
        # at line 34:28: ')'
        match( 0x29 )

      when 4
        # at line 34:34: ';'
        match( 0x3b )

      when 5
        # at line 34:40: WHITESPACE
        whitespace!

      when 6
        # at line 34:53: ','
        match( 0x2c )

      end

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 9 )

    end

    # lexer rule operadores_factor! (OPERADORES_FACTOR)
    # (in Pohua.g)
    def operadores_factor!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 10 )

      type = OPERADORES_FACTOR
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 
      if @input.peek(1) == 0x2a || @input.peek(1) == 0x2f
        @input.consume
      else
        mse = MismatchedSet( nil )
        recover mse
        raise mse
      end



      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 10 )

    end

    # lexer rule operadores_termino! (OPERADORES_TERMINO)
    # (in Pohua.g)
    def operadores_termino!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 11 )

      type = OPERADORES_TERMINO
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 
      if @input.peek(1) == 0x2b || @input.peek(1) == 0x2d
        @input.consume
      else
        mse = MismatchedSet( nil )
        recover mse
        raise mse
      end



      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 11 )

    end

    # lexer rule operadores_comparacion! (OPERADORES_COMPARACION)
    # (in Pohua.g)
    def operadores_comparacion!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 12 )

      type = OPERADORES_COMPARACION
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 40:23: ( '==' | '<' | '>' | '&&' | '||' | '!=' )
      alt_7 = 6
      case look_7 = @input.peek( 1 )
      when 0x3d then alt_7 = 1
      when 0x3c then alt_7 = 2
      when 0x3e then alt_7 = 3
      when 0x26 then alt_7 = 4
      when 0x7c then alt_7 = 5
      when 0x21 then alt_7 = 6
      else
        raise NoViableAlternative( "", 7, 0 )
      end
      case alt_7
      when 1
        # at line 40:25: '=='
        match( "==" )

      when 2
        # at line 40:32: '<'
        match( 0x3c )

      when 3
        # at line 40:38: '>'
        match( 0x3e )

      when 4
        # at line 40:44: '&&'
        match( "&&" )

      when 5
        # at line 40:51: '||'
        match( "||" )

      when 6
        # at line 40:58: '!='
        match( "!=" )

      end
      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 12 )

    end

    # lexer rule operadores_asignacion! (OPERADORES_ASIGNACION)
    # (in Pohua.g)
    def operadores_asignacion!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 13 )

      type = OPERADORES_ASIGNACION
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 42:24: ( '=' )
      # at line 42:24: ( '=' )
      # at line 42:26: '='
      match( 0x3d )


      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 13 )

    end

    # lexer rule letra_may! (LETRA_MAY)
    # (in Pohua.g)
    def letra_may!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 14 )

      
      # - - - - main rule block - - - -
      # at line 45:13: ( 'A' .. 'Z' )
      # at line 45:13: ( 'A' .. 'Z' )
      # at line 45:15: 'A' .. 'Z'
      match_range( 0x41, 0x5a )


    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 14 )

    end

    # lexer rule letra_min! (LETRA_MIN)
    # (in Pohua.g)
    def letra_min!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 15 )

      
      # - - - - main rule block - - - -
      # at line 48:13: ( 'a' .. 'z' )
      # at line 48:13: ( 'a' .. 'z' )
      # at line 48:15: 'a' .. 'z'
      match_range( 0x61, 0x7a )


    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 15 )

    end

    # lexer rule digito! (DIGITO)
    # (in Pohua.g)
    def digito!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 16 )

      
      # - - - - main rule block - - - -
      # at line 51:11: ( '0' .. '9' )
      # at line 51:11: ( '0' .. '9' )
      # at line 51:13: '0' .. '9'
      match_range( 0x30, 0x39 )


    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 16 )

    end

    # lexer rule exponente! (EXPONENTE)
    # (in Pohua.g)
    def exponente!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 17 )

      
      # - - - - main rule block - - - -
      # at line 54:13: ( 'e' | 'E' ) ( '+' | '-' )? ( '0' .. '9' )+
      if @input.peek(1) == 0x45 || @input.peek(1) == 0x65
        @input.consume
      else
        mse = MismatchedSet( nil )
        recover mse
        raise mse
      end


      # at line 54:23: ( '+' | '-' )?
      alt_8 = 2
      look_8_0 = @input.peek( 1 )

      if ( look_8_0 == 0x2b || look_8_0 == 0x2d )
        alt_8 = 1
      end
      case alt_8
      when 1
        # at line 
        if @input.peek(1) == 0x2b || @input.peek(1) == 0x2d
          @input.consume
        else
          mse = MismatchedSet( nil )
          recover mse
          raise mse
        end



      end
      # at file 54:34: ( '0' .. '9' )+
      match_count_9 = 0
      while true
        alt_9 = 2
        look_9_0 = @input.peek( 1 )

        if ( look_9_0.between?( 0x30, 0x39 ) )
          alt_9 = 1

        end
        case alt_9
        when 1
          # at line 54:35: '0' .. '9'
          match_range( 0x30, 0x39 )

        else
          match_count_9 > 0 and break
          eee = EarlyExit(9)


          raise eee
        end
        match_count_9 += 1
      end


    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 17 )

    end

    # lexer rule cualquiera_dentro_string_o_cometario! (CUALQUIERA_DENTRO_STRING_O_COMETARIO)
    # (in Pohua.g)
    def cualquiera_dentro_string_o_cometario!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 18 )

      
      # - - - - main rule block - - - -
      # at line 57:39: ( DIGITO | LETRA_MIN | LETRA_MAY | OPERADORES_ASIGNACION | OPERADORES_COMPARACION | OPERADORES_FACTOR | OPERADORES_TERMINO | SEPARADORES )
      # at line 57:39: ( DIGITO | LETRA_MIN | LETRA_MAY | OPERADORES_ASIGNACION | OPERADORES_COMPARACION | OPERADORES_FACTOR | OPERADORES_TERMINO | SEPARADORES )
      alt_10 = 8
      alt_10 = @dfa10.predict( @input )
      case alt_10
      when 1
        # at line 57:41: DIGITO
        digito!

      when 2
        # at line 57:50: LETRA_MIN
        letra_min!

      when 3
        # at line 57:62: LETRA_MAY
        letra_may!

      when 4
        # at line 57:74: OPERADORES_ASIGNACION
        operadores_asignacion!

      when 5
        # at line 57:97: OPERADORES_COMPARACION
        operadores_comparacion!

      when 6
        # at line 57:122: OPERADORES_FACTOR
        operadores_factor!

      when 7
        # at line 57:142: OPERADORES_TERMINO
        operadores_termino!

      when 8
        # at line 57:163: SEPARADORES
        separadores!

      end

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 18 )

    end

    # main rule used to study the input at the current position,
    # and choose the proper lexer rule to call in order to
    # fetch the next token
    # 
    # usually, you don't make direct calls to this method,
    # but instead use the next_token method, which will
    # build and emit the actual next token
    def token!
      # at line 1:8: ( ID | VARIABLE | CTE_ENTERA | CTE_FLOTANTE | CTE_STRING | CLASES_OB | COMENTARIOS | WHITESPACE | SEPARADORES | OPERADORES_FACTOR | OPERADORES_TERMINO | OPERADORES_COMPARACION | OPERADORES_ASIGNACION )
      alt_11 = 13
      alt_11 = @dfa11.predict( @input )
      case alt_11
      when 1
        # at line 1:10: ID
        id!

      when 2
        # at line 1:13: VARIABLE
        variable!

      when 3
        # at line 1:22: CTE_ENTERA
        cte_entera!

      when 4
        # at line 1:33: CTE_FLOTANTE
        cte_flotante!

      when 5
        # at line 1:46: CTE_STRING
        cte_string!

      when 6
        # at line 1:57: CLASES_OB
        clases_ob!

      when 7
        # at line 1:67: COMENTARIOS
        comentarios!

      when 8
        # at line 1:79: WHITESPACE
        whitespace!

      when 9
        # at line 1:90: SEPARADORES
        separadores!

      when 10
        # at line 1:102: OPERADORES_FACTOR
        operadores_factor!

      when 11
        # at line 1:120: OPERADORES_TERMINO
        operadores_termino!

      when 12
        # at line 1:139: OPERADORES_COMPARACION
        operadores_comparacion!

      when 13
        # at line 1:162: OPERADORES_ASIGNACION
        operadores_asignacion!

      end
    end

    
    # - - - - - - - - - - DFA definitions - - - - - - - - - - -
    class DFA10 < ANTLR3::DFA
      EOT = unpack( 4, -1, 1, 9, 5, -1 )
      EOF = unpack( 10, -1 )
      MIN = unpack( 1, 9, 3, -1, 1, 61, 5, -1 )
      MAX = unpack( 1, 124, 3, -1, 1, 61, 5, -1 )
      ACCEPT = unpack( 1, -1, 1, 1, 1, 2, 1, 3, 1, -1, 1, 5, 1, 6, 1, 7, 
                       1, 8, 1, 4 )
      SPECIAL = unpack( 10, -1 )
      TRANSITION = [
        unpack( 2, 8, 2, -1, 1, 8, 18, -1, 1, 8, 1, 5, 4, -1, 1, 5, 1, -1, 
                2, 8, 1, 6, 1, 7, 1, 8, 1, 7, 1, -1, 1, 6, 10, 1, 2, 8, 
                1, 5, 1, 4, 1, 5, 2, -1, 26, 3, 6, -1, 26, 2, 1, -1, 1, 
                5 ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 5 ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  )
      ].freeze
      
      ( 0 ... MIN.length ).zip( MIN, MAX ) do | i, a, z |
        if a > 0 and z < 0
          MAX[ i ] %= 0x10000
        end
      end
      
      @decision = 10
      

      def description
        <<-'__dfa_description__'.strip!
          57:39: ( DIGITO | LETRA_MIN | LETRA_MAY | OPERADORES_ASIGNACION | OPERADORES_COMPARACION | OPERADORES_FACTOR | OPERADORES_TERMINO | SEPARADORES )
        __dfa_description__
      end
    end
    class DFA11 < ANTLR3::DFA
      EOT = unpack( 3, -1, 1, 13, 7, -1, 1, 16, 5, -1 )
      EOF = unpack( 17, -1 )
      MIN = unpack( 1, 9, 2, -1, 1, 46, 7, -1, 1, 61, 5, -1 )
      MAX = unpack( 1, 124, 2, -1, 1, 57, 7, -1, 1, 61, 5, -1 )
      ACCEPT = unpack( 1, -1, 1, 1, 1, 2, 1, -1, 1, 5, 1, 6, 1, 7, 1, 8, 
                       1, 9, 1, 10, 1, 11, 1, -1, 1, 12, 1, 3, 1, 4, 1, 
                       8, 1, 13 )
      SPECIAL = unpack( 17, -1 )
      TRANSITION = [
        unpack( 2, 7, 2, -1, 1, 7, 18, -1, 1, 7, 1, 12, 1, 4, 1, 6, 2, -1, 
                1, 12, 1, -1, 2, 8, 1, 9, 1, 10, 1, 8, 1, 10, 1, -1, 1, 
                9, 10, 3, 2, 8, 1, 12, 1, 11, 1, 12, 1, -1, 1, 2, 26, 5, 
                6, -1, 26, 1, 1, -1, 1, 12 ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 14, 1, -1, 10, 3 ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 12 ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  )
      ].freeze
      
      ( 0 ... MIN.length ).zip( MIN, MAX ) do | i, a, z |
        if a > 0 and z < 0
          MAX[ i ] %= 0x10000
        end
      end
      
      @decision = 11
      

      def description
        <<-'__dfa_description__'.strip!
          1:1: Tokens : ( ID | VARIABLE | CTE_ENTERA | CTE_FLOTANTE | CTE_STRING | CLASES_OB | COMENTARIOS | WHITESPACE | SEPARADORES | OPERADORES_FACTOR | OPERADORES_TERMINO | OPERADORES_COMPARACION | OPERADORES_ASIGNACION );
        __dfa_description__
      end
    end

    
    private
    
    def initialize_dfas
      super rescue nil
      @dfa10 = DFA10.new( self, 10 )
      @dfa11 = DFA11.new( self, 11 )

    end
  end # class Lexer < ANTLR3::Lexer

  at_exit { Lexer.main( ARGV ) } if __FILE__ == $0
end

