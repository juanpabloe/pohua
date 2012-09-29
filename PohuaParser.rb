#!/usr/bin/env ruby
#
# Pohua.g
# --
# Generated using ANTLR version: 3.2.1-SNAPSHOT Jul 31, 2010 19:34:52
# Ruby runtime library version: 1.8.11
# Input grammar file: Pohua.g
# Generated at: 2012-09-29 14:53:45
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
    define_tokens( :CLASE_OB => 4, :CTE_CHAR => 14, :T__29 => 29, :T__28 => 28, 
                   :T__27 => 27, :T__26 => 26, :DIGITO => 17, :T__25 => 25, 
                   :CTE_ENTERA => 10, :OCTAL_ESC => 24, :COMENTARIOS => 20, 
                   :CTE_FLOTANTE => 11, :ID => 5, :EOF => -1, :ESC_SEQ => 19, 
                   :T__51 => 51, :T__52 => 52, :OPERADOR_LOGICO => 6, :OPERADOR_FACTOR => 9, 
                   :T__50 => 50, :T__42 => 42, :T__43 => 43, :T__40 => 40, 
                   :T__41 => 41, :T__46 => 46, :T__47 => 47, :T__44 => 44, 
                   :T__45 => 45, :T__48 => 48, :T__49 => 49, :OPERADOR_COMPARACION => 7, 
                   :UNICODE_ESC => 23, :LETRA_MIN => 15, :EXPONENTE => 18, 
                   :HEX_DIGIT => 22, :WHITESPACE => 21, :T__30 => 30, :T__31 => 31, 
                   :CTE_STRING => 12, :T__32 => 32, :T__33 => 33, :T__34 => 34, 
                   :T__35 => 35, :T__36 => 36, :T__37 => 37, :T__38 => 38, 
                   :OPERADOR_TERMINO => 8, :T__39 => 39, :CTE_BOLEANA => 13, 
                   :LETRA_MAY => 16 )

    # register the proper human-readable name or literal value
    # for each token type
    #
    # this is necessary because anonymous tokens, which are
    # created from literal values in the grammar, do not
    # have descriptive names
    register_names( "CLASE_OB", "ID", "OPERADOR_LOGICO", "OPERADOR_COMPARACION", 
                    "OPERADOR_TERMINO", "OPERADOR_FACTOR", "CTE_ENTERA", 
                    "CTE_FLOTANTE", "CTE_STRING", "CTE_BOLEANA", "CTE_CHAR", 
                    "LETRA_MIN", "LETRA_MAY", "DIGITO", "EXPONENTE", "ESC_SEQ", 
                    "COMENTARIOS", "WHITESPACE", "HEX_DIGIT", "UNICODE_ESC", 
                    "OCTAL_ESC", "'clase'", "'extiende'", "':'", "'fin'", 
                    "'Principal'", "'metodo'", "'vacuo'", "'principal'", 
                    "';'", "'regresa'", "'ent'", "'flot'", "'string'", "'bol'", 
                    "'char'", "'('", "','", "')'", "'este'", "'.'", "'='", 
                    "'si?'", "'sino'", "'imprime'", "'lee'", "'mientras'", 
                    "'para'", "'nuevo'" )
    
  end


  class Parser < ANTLR3::Parser
    @grammar_home = Pohua

    RULE_METHODS = [ :programa, :clase, :clase_principal, :met_principal, 
                     :bloque, :dec_variable, :metodo, :met_tipado, :met_vacuo, 
                     :tipo, :parametro, :estatuto, :asignacion, :condicion, 
                     :escritura, :lectura, :ciclo, :mientras, :para, :expresion, 
                     :e, :exp, :termino, :factor, :var_cte, :invocacion ].freeze


    include TokenData

    begin
      generated_using( "Pohua.g", "3.2.1-SNAPSHOT Jul 31, 2010 19:34:52", "1.8.11" )
    rescue NoMethodError => error
      # ignore
    end

    def initialize( input, options = {} )
      super( input, options )


    end
    # - - - - - - - - - - - - Rules - - - - - - - - - - - - -

    # 
    # parser rule programa
    # 
    # (in Pohua.g)
    # 3:1: programa : ( clase )* clase_principal ;
    # 
    def programa
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 1 )

      begin
        # at line 4:4: ( clase )* clase_principal
        # at line 4:4: ( clase )*
        while true # decision 1
          alt_1 = 2
          look_1_0 = @input.peek( 1 )

          if ( look_1_0 == T__25 )
            look_1_1 = @input.peek( 2 )

            if ( look_1_1 == CLASE_OB )
              alt_1 = 1

            end

          end
          case alt_1
          when 1
            # at line 4:4: clase
            @state.following.push( TOKENS_FOLLOWING_clase_IN_programa_12 )
            clase
            @state.following.pop

          else
            break # out of loop for decision 1
          end
        end # loop for decision 1
        @state.following.push( TOKENS_FOLLOWING_clase_principal_IN_programa_16 )
        clase_principal
        @state.following.pop

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 1 )

      end
      
      return 
    end


    # 
    # parser rule clase
    # 
    # (in Pohua.g)
    # 7:1: clase : 'clase' CLASE_OB ( 'extiende' CLASE_OB )? ':' ( dec_variable )* ( metodo )* 'fin' ;
    # 
    def clase
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 2 )

      begin
        # at line 7:9: 'clase' CLASE_OB ( 'extiende' CLASE_OB )? ':' ( dec_variable )* ( metodo )* 'fin'
        match( T__25, TOKENS_FOLLOWING_T__25_IN_clase_27 )
        match( CLASE_OB, TOKENS_FOLLOWING_CLASE_OB_IN_clase_29 )
        # at line 7:26: ( 'extiende' CLASE_OB )?
        alt_2 = 2
        look_2_0 = @input.peek( 1 )

        if ( look_2_0 == T__26 )
          alt_2 = 1
        end
        case alt_2
        when 1
          # at line 7:27: 'extiende' CLASE_OB
          match( T__26, TOKENS_FOLLOWING_T__26_IN_clase_32 )
          match( CLASE_OB, TOKENS_FOLLOWING_CLASE_OB_IN_clase_34 )

        end
        match( T__27, TOKENS_FOLLOWING_T__27_IN_clase_38 )
        # at line 7:53: ( dec_variable )*
        while true # decision 3
          alt_3 = 2
          look_3_0 = @input.peek( 1 )

          if ( look_3_0 == CLASE_OB || look_3_0.between?( T__35, T__39 ) )
            alt_3 = 1

          end
          case alt_3
          when 1
            # at line 7:53: dec_variable
            @state.following.push( TOKENS_FOLLOWING_dec_variable_IN_clase_40 )
            dec_variable
            @state.following.pop

          else
            break # out of loop for decision 3
          end
        end # loop for decision 3
        # at line 7:67: ( metodo )*
        while true # decision 4
          alt_4 = 2
          look_4_0 = @input.peek( 1 )

          if ( look_4_0 == T__30 )
            alt_4 = 1

          end
          case alt_4
          when 1
            # at line 7:67: metodo
            @state.following.push( TOKENS_FOLLOWING_metodo_IN_clase_43 )
            metodo
            @state.following.pop

          else
            break # out of loop for decision 4
          end
        end # loop for decision 4
        match( T__28, TOKENS_FOLLOWING_T__28_IN_clase_46 )

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 2 )

      end
      
      return 
    end


    # 
    # parser rule clase_principal
    # 
    # (in Pohua.g)
    # 9:1: clase_principal : 'clase' 'Principal' ':' met_principal ( metodo )* 'fin' ;
    # 
    def clase_principal
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 3 )

      begin
        # at line 10:4: 'clase' 'Principal' ':' met_principal ( metodo )* 'fin'
        match( T__25, TOKENS_FOLLOWING_T__25_IN_clase_principal_55 )
        match( T__29, TOKENS_FOLLOWING_T__29_IN_clase_principal_57 )
        match( T__27, TOKENS_FOLLOWING_T__27_IN_clase_principal_59 )
        @state.following.push( TOKENS_FOLLOWING_met_principal_IN_clase_principal_61 )
        met_principal
        @state.following.pop
        # at line 10:42: ( metodo )*
        while true # decision 5
          alt_5 = 2
          look_5_0 = @input.peek( 1 )

          if ( look_5_0 == T__30 )
            alt_5 = 1

          end
          case alt_5
          when 1
            # at line 10:42: metodo
            @state.following.push( TOKENS_FOLLOWING_metodo_IN_clase_principal_63 )
            metodo
            @state.following.pop

          else
            break # out of loop for decision 5
          end
        end # loop for decision 5
        match( T__28, TOKENS_FOLLOWING_T__28_IN_clase_principal_66 )

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 3 )

      end
      
      return 
    end


    # 
    # parser rule met_principal
    # 
    # (in Pohua.g)
    # 13:1: met_principal : 'metodo' 'vacuo' 'principal' ':' ( bloque )* 'fin' ;
    # 
    def met_principal
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 4 )

      begin
        # at line 14:4: 'metodo' 'vacuo' 'principal' ':' ( bloque )* 'fin'
        match( T__30, TOKENS_FOLLOWING_T__30_IN_met_principal_78 )
        match( T__31, TOKENS_FOLLOWING_T__31_IN_met_principal_80 )
        match( T__32, TOKENS_FOLLOWING_T__32_IN_met_principal_82 )
        match( T__27, TOKENS_FOLLOWING_T__27_IN_met_principal_84 )
        # at line 14:37: ( bloque )*
        while true # decision 6
          alt_6 = 2
          look_6_0 = @input.peek( 1 )

          if ( look_6_0.between?( CLASE_OB, ID ) || look_6_0.between?( T__35, T__39 ) || look_6_0 == T__43 || look_6_0 == T__46 || look_6_0 == T__48 || look_6_0.between?( T__50, T__51 ) )
            alt_6 = 1

          end
          case alt_6
          when 1
            # at line 14:37: bloque
            @state.following.push( TOKENS_FOLLOWING_bloque_IN_met_principal_86 )
            bloque
            @state.following.pop

          else
            break # out of loop for decision 6
          end
        end # loop for decision 6
        match( T__28, TOKENS_FOLLOWING_T__28_IN_met_principal_89 )

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 4 )

      end
      
      return 
    end


    # 
    # parser rule bloque
    # 
    # (in Pohua.g)
    # 17:1: bloque : ( dec_variable | estatuto );
    # 
    def bloque
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 5 )

      begin
        # at line 17:8: ( dec_variable | estatuto )
        alt_7 = 2
        look_7_0 = @input.peek( 1 )

        if ( look_7_0 == CLASE_OB || look_7_0.between?( T__35, T__39 ) )
          alt_7 = 1
        elsif ( look_7_0 == ID || look_7_0 == T__43 || look_7_0 == T__46 || look_7_0 == T__48 || look_7_0.between?( T__50, T__51 ) )
          alt_7 = 2
        else
          raise NoViableAlternative( "", 7, 0 )
        end
        case alt_7
        when 1
          # at line 17:10: dec_variable
          @state.following.push( TOKENS_FOLLOWING_dec_variable_IN_bloque_99 )
          dec_variable
          @state.following.pop

        when 2
          # at line 18:4: estatuto
          @state.following.push( TOKENS_FOLLOWING_estatuto_IN_bloque_104 )
          estatuto
          @state.following.pop

        end
      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 5 )

      end
      
      return 
    end


    # 
    # parser rule dec_variable
    # 
    # (in Pohua.g)
    # 21:1: dec_variable : tipo ID ';' ;
    # 
    def dec_variable
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 6 )

      begin
        # at line 22:4: tipo ID ';'
        @state.following.push( TOKENS_FOLLOWING_tipo_IN_dec_variable_116 )
        tipo
        @state.following.pop
        match( ID, TOKENS_FOLLOWING_ID_IN_dec_variable_118 )
        match( T__33, TOKENS_FOLLOWING_T__33_IN_dec_variable_120 )

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 6 )

      end
      
      return 
    end


    # 
    # parser rule metodo
    # 
    # (in Pohua.g)
    # 25:1: metodo : 'metodo' ( met_tipado | met_vacuo ) ;
    # 
    def metodo
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 7 )

      begin
        # at line 25:10: 'metodo' ( met_tipado | met_vacuo )
        match( T__30, TOKENS_FOLLOWING_T__30_IN_metodo_130 )
        # at line 25:19: ( met_tipado | met_vacuo )
        alt_8 = 2
        look_8_0 = @input.peek( 1 )

        if ( look_8_0 == CLASE_OB || look_8_0.between?( T__35, T__39 ) )
          alt_8 = 1
        elsif ( look_8_0 == T__31 )
          alt_8 = 2
        else
          raise NoViableAlternative( "", 8, 0 )
        end
        case alt_8
        when 1
          # at line 25:20: met_tipado
          @state.following.push( TOKENS_FOLLOWING_met_tipado_IN_metodo_133 )
          met_tipado
          @state.following.pop

        when 2
          # at line 25:33: met_vacuo
          @state.following.push( TOKENS_FOLLOWING_met_vacuo_IN_metodo_137 )
          met_vacuo
          @state.following.pop

        end

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 7 )

      end
      
      return 
    end


    # 
    # parser rule met_tipado
    # 
    # (in Pohua.g)
    # 27:1: met_tipado : tipo ID ( parametro )? ':' ( bloque )* 'regresa' expresion 'fin' ;
    # 
    def met_tipado
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 8 )

      begin
        # at line 28:4: tipo ID ( parametro )? ':' ( bloque )* 'regresa' expresion 'fin'
        @state.following.push( TOKENS_FOLLOWING_tipo_IN_met_tipado_148 )
        tipo
        @state.following.pop
        match( ID, TOKENS_FOLLOWING_ID_IN_met_tipado_150 )
        # at line 28:12: ( parametro )?
        alt_9 = 2
        look_9_0 = @input.peek( 1 )

        if ( look_9_0 == T__40 )
          alt_9 = 1
        end
        case alt_9
        when 1
          # at line 28:12: parametro
          @state.following.push( TOKENS_FOLLOWING_parametro_IN_met_tipado_152 )
          parametro
          @state.following.pop

        end
        match( T__27, TOKENS_FOLLOWING_T__27_IN_met_tipado_155 )
        # at line 28:27: ( bloque )*
        while true # decision 10
          alt_10 = 2
          look_10_0 = @input.peek( 1 )

          if ( look_10_0.between?( CLASE_OB, ID ) || look_10_0.between?( T__35, T__39 ) || look_10_0 == T__43 || look_10_0 == T__46 || look_10_0 == T__48 || look_10_0.between?( T__50, T__51 ) )
            alt_10 = 1

          end
          case alt_10
          when 1
            # at line 28:27: bloque
            @state.following.push( TOKENS_FOLLOWING_bloque_IN_met_tipado_157 )
            bloque
            @state.following.pop

          else
            break # out of loop for decision 10
          end
        end # loop for decision 10
        match( T__34, TOKENS_FOLLOWING_T__34_IN_met_tipado_160 )
        @state.following.push( TOKENS_FOLLOWING_expresion_IN_met_tipado_162 )
        expresion
        @state.following.pop
        match( T__28, TOKENS_FOLLOWING_T__28_IN_met_tipado_164 )

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 8 )

      end
      
      return 
    end


    # 
    # parser rule met_vacuo
    # 
    # (in Pohua.g)
    # 31:1: met_vacuo : 'vacuo' ID ( parametro )? ':' ( bloque )* 'fin' ;
    # 
    def met_vacuo
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 9 )

      begin
        # at line 32:4: 'vacuo' ID ( parametro )? ':' ( bloque )* 'fin'
        match( T__31, TOKENS_FOLLOWING_T__31_IN_met_vacuo_176 )
        match( ID, TOKENS_FOLLOWING_ID_IN_met_vacuo_178 )
        # at line 32:15: ( parametro )?
        alt_11 = 2
        look_11_0 = @input.peek( 1 )

        if ( look_11_0 == T__40 )
          alt_11 = 1
        end
        case alt_11
        when 1
          # at line 32:15: parametro
          @state.following.push( TOKENS_FOLLOWING_parametro_IN_met_vacuo_180 )
          parametro
          @state.following.pop

        end
        match( T__27, TOKENS_FOLLOWING_T__27_IN_met_vacuo_183 )
        # at line 32:30: ( bloque )*
        while true # decision 12
          alt_12 = 2
          look_12_0 = @input.peek( 1 )

          if ( look_12_0.between?( CLASE_OB, ID ) || look_12_0.between?( T__35, T__39 ) || look_12_0 == T__43 || look_12_0 == T__46 || look_12_0 == T__48 || look_12_0.between?( T__50, T__51 ) )
            alt_12 = 1

          end
          case alt_12
          when 1
            # at line 32:30: bloque
            @state.following.push( TOKENS_FOLLOWING_bloque_IN_met_vacuo_185 )
            bloque
            @state.following.pop

          else
            break # out of loop for decision 12
          end
        end # loop for decision 12
        match( T__28, TOKENS_FOLLOWING_T__28_IN_met_vacuo_188 )

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 9 )

      end
      
      return 
    end


    # 
    # parser rule tipo
    # 
    # (in Pohua.g)
    # 35:1: tipo : ( 'ent' | 'flot' | 'string' | 'bol' | 'char' | CLASE_OB );
    # 
    def tipo
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 10 )

      begin
        # at line 
        if @input.peek(1) == CLASE_OB || @input.peek( 1 ).between?( T__35, T__39 )
          @input.consume
          @state.error_recovery = false
        else
          mse = MismatchedSet( nil )
          raise mse
        end



      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 10 )

      end
      
      return 
    end


    # 
    # parser rule parametro
    # 
    # (in Pohua.g)
    # 43:1: parametro : '(' tipo ID ( ',' tipo ID )* ')' ;
    # 
    def parametro
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 11 )

      begin
        # at line 44:4: '(' tipo ID ( ',' tipo ID )* ')'
        match( T__40, TOKENS_FOLLOWING_T__40_IN_parametro_236 )
        @state.following.push( TOKENS_FOLLOWING_tipo_IN_parametro_238 )
        tipo
        @state.following.pop
        match( ID, TOKENS_FOLLOWING_ID_IN_parametro_240 )
        # at line 44:16: ( ',' tipo ID )*
        while true # decision 13
          alt_13 = 2
          look_13_0 = @input.peek( 1 )

          if ( look_13_0 == T__41 )
            alt_13 = 1

          end
          case alt_13
          when 1
            # at line 44:18: ',' tipo ID
            match( T__41, TOKENS_FOLLOWING_T__41_IN_parametro_244 )
            @state.following.push( TOKENS_FOLLOWING_tipo_IN_parametro_246 )
            tipo
            @state.following.pop
            match( ID, TOKENS_FOLLOWING_ID_IN_parametro_248 )

          else
            break # out of loop for decision 13
          end
        end # loop for decision 13
        match( T__42, TOKENS_FOLLOWING_T__42_IN_parametro_252 )

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 11 )

      end
      
      return 
    end


    # 
    # parser rule estatuto
    # 
    # (in Pohua.g)
    # 47:1: estatuto : ( asignacion | condicion | escritura | ciclo | ID invocacion );
    # 
    def estatuto
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 12 )

      begin
        # at line 48:2: ( asignacion | condicion | escritura | ciclo | ID invocacion )
        alt_14 = 5
        case look_14 = @input.peek( 1 )
        when ID then look_14_1 = @input.peek( 2 )

        if ( look_14_1 == T__44 )
          look_14_6 = @input.peek( 3 )

          if ( look_14_6 == ID )
            look_14_7 = @input.peek( 4 )

            if ( look_14_7 == T__40 )
              alt_14 = 5
            elsif ( look_14_7 == T__45 )
              alt_14 = 1
            else
              raise NoViableAlternative( "", 14, 7 )
            end
          else
            raise NoViableAlternative( "", 14, 6 )
          end
        elsif ( look_14_1 == T__45 )
          alt_14 = 1
        else
          raise NoViableAlternative( "", 14, 1 )
        end
        when T__46 then alt_14 = 2
        when T__48 then alt_14 = 3
        when T__50, T__51 then alt_14 = 4
        when T__43 then alt_14 = 1
        else
          raise NoViableAlternative( "", 14, 0 )
        end
        case alt_14
        when 1
          # at line 48:4: asignacion
          @state.following.push( TOKENS_FOLLOWING_asignacion_IN_estatuto_264 )
          asignacion
          @state.following.pop

        when 2
          # at line 49:4: condicion
          @state.following.push( TOKENS_FOLLOWING_condicion_IN_estatuto_269 )
          condicion
          @state.following.pop

        when 3
          # at line 50:4: escritura
          @state.following.push( TOKENS_FOLLOWING_escritura_IN_estatuto_274 )
          escritura
          @state.following.pop

        when 4
          # at line 51:4: ciclo
          @state.following.push( TOKENS_FOLLOWING_ciclo_IN_estatuto_279 )
          ciclo
          @state.following.pop

        when 5
          # at line 52:4: ID invocacion
          match( ID, TOKENS_FOLLOWING_ID_IN_estatuto_284 )
          @state.following.push( TOKENS_FOLLOWING_invocacion_IN_estatuto_286 )
          invocacion
          @state.following.pop

        end
      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 12 )

      end
      
      return 
    end


    # 
    # parser rule asignacion
    # 
    # (in Pohua.g)
    # 55:1: asignacion : ( 'este' | ID ) ( '.' ID )? '=' ( expresion | lectura ) ';' ;
    # 
    def asignacion
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 13 )

      begin
        # at line 56:5: ( 'este' | ID ) ( '.' ID )? '=' ( expresion | lectura ) ';'
        if @input.peek(1) == ID || @input.peek(1) == T__43
          @input.consume
          @state.error_recovery = false
        else
          mse = MismatchedSet( nil )
          raise mse
        end


        # at line 56:19: ( '.' ID )?
        alt_15 = 2
        look_15_0 = @input.peek( 1 )

        if ( look_15_0 == T__44 )
          alt_15 = 1
        end
        case alt_15
        when 1
          # at line 56:21: '.' ID
          match( T__44, TOKENS_FOLLOWING_T__44_IN_asignacion_309 )
          match( ID, TOKENS_FOLLOWING_ID_IN_asignacion_311 )

        end
        match( T__45, TOKENS_FOLLOWING_T__45_IN_asignacion_315 )
        # at line 56:35: ( expresion | lectura )
        alt_16 = 2
        look_16_0 = @input.peek( 1 )

        if ( look_16_0 == ID || look_16_0 == OPERADOR_TERMINO || look_16_0.between?( CTE_ENTERA, CTE_CHAR ) || look_16_0 == T__40 || look_16_0 == T__43 || look_16_0 == T__52 )
          alt_16 = 1
        elsif ( look_16_0 == T__49 )
          alt_16 = 2
        else
          raise NoViableAlternative( "", 16, 0 )
        end
        case alt_16
        when 1
          # at line 56:37: expresion
          @state.following.push( TOKENS_FOLLOWING_expresion_IN_asignacion_320 )
          expresion
          @state.following.pop

        when 2
          # at line 56:49: lectura
          @state.following.push( TOKENS_FOLLOWING_lectura_IN_asignacion_324 )
          lectura
          @state.following.pop

        end
        match( T__33, TOKENS_FOLLOWING_T__33_IN_asignacion_328 )

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 13 )

      end
      
      return 
    end


    # 
    # parser rule condicion
    # 
    # (in Pohua.g)
    # 58:1: condicion : 'si?' '(' expresion ')' ':' ( estatuto )* ( 'sino' estatuto )? 'fin' ;
    # 
    def condicion
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 14 )

      begin
        # at line 59:4: 'si?' '(' expresion ')' ':' ( estatuto )* ( 'sino' estatuto )? 'fin'
        match( T__46, TOKENS_FOLLOWING_T__46_IN_condicion_338 )
        match( T__40, TOKENS_FOLLOWING_T__40_IN_condicion_340 )
        @state.following.push( TOKENS_FOLLOWING_expresion_IN_condicion_342 )
        expresion
        @state.following.pop
        match( T__42, TOKENS_FOLLOWING_T__42_IN_condicion_344 )
        match( T__27, TOKENS_FOLLOWING_T__27_IN_condicion_346 )
        # at line 59:32: ( estatuto )*
        while true # decision 17
          alt_17 = 2
          look_17_0 = @input.peek( 1 )

          if ( look_17_0 == ID || look_17_0 == T__43 || look_17_0 == T__46 || look_17_0 == T__48 || look_17_0.between?( T__50, T__51 ) )
            alt_17 = 1

          end
          case alt_17
          when 1
            # at line 59:32: estatuto
            @state.following.push( TOKENS_FOLLOWING_estatuto_IN_condicion_348 )
            estatuto
            @state.following.pop

          else
            break # out of loop for decision 17
          end
        end # loop for decision 17
        # at line 59:42: ( 'sino' estatuto )?
        alt_18 = 2
        look_18_0 = @input.peek( 1 )

        if ( look_18_0 == T__47 )
          alt_18 = 1
        end
        case alt_18
        when 1
          # at line 59:44: 'sino' estatuto
          match( T__47, TOKENS_FOLLOWING_T__47_IN_condicion_353 )
          @state.following.push( TOKENS_FOLLOWING_estatuto_IN_condicion_355 )
          estatuto
          @state.following.pop

        end
        match( T__28, TOKENS_FOLLOWING_T__28_IN_condicion_360 )

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 14 )

      end
      
      return 
    end


    # 
    # parser rule escritura
    # 
    # (in Pohua.g)
    # 62:1: escritura : 'imprime' '(' expresion ( ',' expresion )* ')' ';' ;
    # 
    def escritura
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 15 )

      begin
        # at line 63:4: 'imprime' '(' expresion ( ',' expresion )* ')' ';'
        match( T__48, TOKENS_FOLLOWING_T__48_IN_escritura_372 )
        match( T__40, TOKENS_FOLLOWING_T__40_IN_escritura_374 )
        @state.following.push( TOKENS_FOLLOWING_expresion_IN_escritura_376 )
        expresion
        @state.following.pop
        # at line 63:28: ( ',' expresion )*
        while true # decision 19
          alt_19 = 2
          look_19_0 = @input.peek( 1 )

          if ( look_19_0 == T__41 )
            alt_19 = 1

          end
          case alt_19
          when 1
            # at line 63:30: ',' expresion
            match( T__41, TOKENS_FOLLOWING_T__41_IN_escritura_380 )
            @state.following.push( TOKENS_FOLLOWING_expresion_IN_escritura_382 )
            expresion
            @state.following.pop

          else
            break # out of loop for decision 19
          end
        end # loop for decision 19
        match( T__42, TOKENS_FOLLOWING_T__42_IN_escritura_387 )
        match( T__33, TOKENS_FOLLOWING_T__33_IN_escritura_389 )

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 15 )

      end
      
      return 
    end


    # 
    # parser rule lectura
    # 
    # (in Pohua.g)
    # 66:1: lectura : 'lee' '(' ')' ;
    # 
    def lectura
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 16 )

      begin
        # at line 66:11: 'lee' '(' ')'
        match( T__49, TOKENS_FOLLOWING_T__49_IN_lectura_400 )
        match( T__40, TOKENS_FOLLOWING_T__40_IN_lectura_402 )
        match( T__42, TOKENS_FOLLOWING_T__42_IN_lectura_404 )

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 16 )

      end
      
      return 
    end


    # 
    # parser rule ciclo
    # 
    # (in Pohua.g)
    # 69:1: ciclo : ( mientras | para );
    # 
    def ciclo
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 17 )

      begin
        # at line 69:7: ( mientras | para )
        alt_20 = 2
        look_20_0 = @input.peek( 1 )

        if ( look_20_0 == T__50 )
          alt_20 = 1
        elsif ( look_20_0 == T__51 )
          alt_20 = 2
        else
          raise NoViableAlternative( "", 20, 0 )
        end
        case alt_20
        when 1
          # at line 69:9: mientras
          @state.following.push( TOKENS_FOLLOWING_mientras_IN_ciclo_415 )
          mientras
          @state.following.pop

        when 2
          # at line 70:4: para
          @state.following.push( TOKENS_FOLLOWING_para_IN_ciclo_420 )
          para
          @state.following.pop

        end
      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 17 )

      end
      
      return 
    end


    # 
    # parser rule mientras
    # 
    # (in Pohua.g)
    # 73:1: mientras : 'mientras' '(' expresion ')' ':' estatuto 'fin' ;
    # 
    def mientras
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 18 )

      begin
        # at line 74:4: 'mientras' '(' expresion ')' ':' estatuto 'fin'
        match( T__50, TOKENS_FOLLOWING_T__50_IN_mientras_432 )
        match( T__40, TOKENS_FOLLOWING_T__40_IN_mientras_434 )
        @state.following.push( TOKENS_FOLLOWING_expresion_IN_mientras_436 )
        expresion
        @state.following.pop
        match( T__42, TOKENS_FOLLOWING_T__42_IN_mientras_438 )
        match( T__27, TOKENS_FOLLOWING_T__27_IN_mientras_440 )
        @state.following.push( TOKENS_FOLLOWING_estatuto_IN_mientras_442 )
        estatuto
        @state.following.pop
        match( T__28, TOKENS_FOLLOWING_T__28_IN_mientras_444 )

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 18 )

      end
      
      return 
    end


    # 
    # parser rule para
    # 
    # (in Pohua.g)
    # 76:1: para : 'para' '(' asignacion ';' expresion ';' expresion ';' ')' estatuto 'fin' ;
    # 
    def para
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 19 )

      begin
        # at line 76:9: 'para' '(' asignacion ';' expresion ';' expresion ';' ')' estatuto 'fin'
        match( T__51, TOKENS_FOLLOWING_T__51_IN_para_454 )
        match( T__40, TOKENS_FOLLOWING_T__40_IN_para_456 )
        @state.following.push( TOKENS_FOLLOWING_asignacion_IN_para_458 )
        asignacion
        @state.following.pop
        match( T__33, TOKENS_FOLLOWING_T__33_IN_para_460 )
        @state.following.push( TOKENS_FOLLOWING_expresion_IN_para_462 )
        expresion
        @state.following.pop
        match( T__33, TOKENS_FOLLOWING_T__33_IN_para_464 )
        @state.following.push( TOKENS_FOLLOWING_expresion_IN_para_466 )
        expresion
        @state.following.pop
        match( T__33, TOKENS_FOLLOWING_T__33_IN_para_468 )
        match( T__42, TOKENS_FOLLOWING_T__42_IN_para_470 )
        @state.following.push( TOKENS_FOLLOWING_estatuto_IN_para_472 )
        estatuto
        @state.following.pop
        match( T__28, TOKENS_FOLLOWING_T__28_IN_para_474 )

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 19 )

      end
      
      return 
    end


    # 
    # parser rule expresion
    # 
    # (in Pohua.g)
    # 77:1: expresion : e ( OPERADOR_LOGICO e )? ;
    # 
    def expresion
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 20 )

      begin
        # at line 78:4: e ( OPERADOR_LOGICO e )?
        @state.following.push( TOKENS_FOLLOWING_e_IN_expresion_483 )
        e
        @state.following.pop
        # at line 78:6: ( OPERADOR_LOGICO e )?
        alt_21 = 2
        look_21_0 = @input.peek( 1 )

        if ( look_21_0 == OPERADOR_LOGICO )
          alt_21 = 1
        end
        case alt_21
        when 1
          # at line 78:8: OPERADOR_LOGICO e
          match( OPERADOR_LOGICO, TOKENS_FOLLOWING_OPERADOR_LOGICO_IN_expresion_487 )
          @state.following.push( TOKENS_FOLLOWING_e_IN_expresion_489 )
          e
          @state.following.pop

        end

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 20 )

      end
      
      return 
    end


    # 
    # parser rule e
    # 
    # (in Pohua.g)
    # 81:1: e : exp ( OPERADOR_COMPARACION exp )? ;
    # 
    def e
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 21 )

      begin
        # at line 81:5: exp ( OPERADOR_COMPARACION exp )?
        @state.following.push( TOKENS_FOLLOWING_exp_IN_e_502 )
        exp
        @state.following.pop
        # at line 81:9: ( OPERADOR_COMPARACION exp )?
        alt_22 = 2
        look_22_0 = @input.peek( 1 )

        if ( look_22_0 == OPERADOR_COMPARACION )
          alt_22 = 1
        end
        case alt_22
        when 1
          # at line 81:11: OPERADOR_COMPARACION exp
          match( OPERADOR_COMPARACION, TOKENS_FOLLOWING_OPERADOR_COMPARACION_IN_e_506 )
          @state.following.push( TOKENS_FOLLOWING_exp_IN_e_508 )
          exp
          @state.following.pop

        end

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 21 )

      end
      
      return 
    end


    # 
    # parser rule exp
    # 
    # (in Pohua.g)
    # 84:1: exp : termino ( OPERADOR_TERMINO exp )* ;
    # 
    def exp
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 22 )

      begin
        # at line 84:7: termino ( OPERADOR_TERMINO exp )*
        @state.following.push( TOKENS_FOLLOWING_termino_IN_exp_522 )
        termino
        @state.following.pop
        # at line 84:15: ( OPERADOR_TERMINO exp )*
        while true # decision 23
          alt_23 = 2
          look_23_0 = @input.peek( 1 )

          if ( look_23_0 == OPERADOR_TERMINO )
            alt_23 = 1

          end
          case alt_23
          when 1
            # at line 84:17: OPERADOR_TERMINO exp
            match( OPERADOR_TERMINO, TOKENS_FOLLOWING_OPERADOR_TERMINO_IN_exp_526 )
            @state.following.push( TOKENS_FOLLOWING_exp_IN_exp_528 )
            exp
            @state.following.pop

          else
            break # out of loop for decision 23
          end
        end # loop for decision 23

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 22 )

      end
      
      return 
    end


    # 
    # parser rule termino
    # 
    # (in Pohua.g)
    # 86:1: termino : factor ( OPERADOR_FACTOR termino )* ;
    # 
    def termino
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 23 )

      begin
        # at line 86:11: factor ( OPERADOR_FACTOR termino )*
        @state.following.push( TOKENS_FOLLOWING_factor_IN_termino_540 )
        factor
        @state.following.pop
        # at line 86:18: ( OPERADOR_FACTOR termino )*
        while true # decision 24
          alt_24 = 2
          look_24_0 = @input.peek( 1 )

          if ( look_24_0 == OPERADOR_FACTOR )
            alt_24 = 1

          end
          case alt_24
          when 1
            # at line 86:20: OPERADOR_FACTOR termino
            match( OPERADOR_FACTOR, TOKENS_FOLLOWING_OPERADOR_FACTOR_IN_termino_544 )
            @state.following.push( TOKENS_FOLLOWING_termino_IN_termino_546 )
            termino
            @state.following.pop

          else
            break # out of loop for decision 24
          end
        end # loop for decision 24

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 23 )

      end
      
      return 
    end


    # 
    # parser rule factor
    # 
    # (in Pohua.g)
    # 88:1: factor : ( '(' expresion ')' | ( OPERADOR_TERMINO )? var_cte );
    # 
    def factor
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 24 )

      begin
        # at line 88:9: ( '(' expresion ')' | ( OPERADOR_TERMINO )? var_cte )
        alt_26 = 2
        look_26_0 = @input.peek( 1 )

        if ( look_26_0 == T__40 )
          alt_26 = 1
        elsif ( look_26_0 == ID || look_26_0 == OPERADOR_TERMINO || look_26_0.between?( CTE_ENTERA, CTE_CHAR ) || look_26_0 == T__43 || look_26_0 == T__52 )
          alt_26 = 2
        else
          raise NoViableAlternative( "", 26, 0 )
        end
        case alt_26
        when 1
          # at line 88:11: '(' expresion ')'
          match( T__40, TOKENS_FOLLOWING_T__40_IN_factor_559 )
          @state.following.push( TOKENS_FOLLOWING_expresion_IN_factor_561 )
          expresion
          @state.following.pop
          match( T__42, TOKENS_FOLLOWING_T__42_IN_factor_563 )

        when 2
          # at line 89:4: ( OPERADOR_TERMINO )? var_cte
          # at line 89:4: ( OPERADOR_TERMINO )?
          alt_25 = 2
          look_25_0 = @input.peek( 1 )

          if ( look_25_0 == OPERADOR_TERMINO )
            alt_25 = 1
          end
          case alt_25
          when 1
            # at line 89:4: OPERADOR_TERMINO
            match( OPERADOR_TERMINO, TOKENS_FOLLOWING_OPERADOR_TERMINO_IN_factor_569 )

          end
          @state.following.push( TOKENS_FOLLOWING_var_cte_IN_factor_572 )
          var_cte
          @state.following.pop

        end
      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 24 )

      end
      
      return 
    end


    # 
    # parser rule var_cte
    # 
    # (in Pohua.g)
    # 92:1: var_cte : ( ID | CTE_ENTERA | CTE_FLOTANTE | CTE_STRING | CTE_BOLEANA | CTE_CHAR | 'este' | 'nuevo' CLASE_OB ) ( invocacion )? ;
    # 
    def var_cte
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 25 )

      begin
        # at line 92:12: ( ID | CTE_ENTERA | CTE_FLOTANTE | CTE_STRING | CTE_BOLEANA | CTE_CHAR | 'este' | 'nuevo' CLASE_OB ) ( invocacion )?
        # at line 92:12: ( ID | CTE_ENTERA | CTE_FLOTANTE | CTE_STRING | CTE_BOLEANA | CTE_CHAR | 'este' | 'nuevo' CLASE_OB )
        alt_27 = 8
        case look_27 = @input.peek( 1 )
        when ID then alt_27 = 1
        when CTE_ENTERA then alt_27 = 2
        when CTE_FLOTANTE then alt_27 = 3
        when CTE_STRING then alt_27 = 4
        when CTE_BOLEANA then alt_27 = 5
        when CTE_CHAR then alt_27 = 6
        when T__43 then alt_27 = 7
        when T__52 then alt_27 = 8
        else
          raise NoViableAlternative( "", 27, 0 )
        end
        case alt_27
        when 1
          # at line 92:14: ID
          match( ID, TOKENS_FOLLOWING_ID_IN_var_cte_585 )

        when 2
          # at line 93:4: CTE_ENTERA
          match( CTE_ENTERA, TOKENS_FOLLOWING_CTE_ENTERA_IN_var_cte_590 )

        when 3
          # at line 94:4: CTE_FLOTANTE
          match( CTE_FLOTANTE, TOKENS_FOLLOWING_CTE_FLOTANTE_IN_var_cte_595 )

        when 4
          # at line 95:4: CTE_STRING
          match( CTE_STRING, TOKENS_FOLLOWING_CTE_STRING_IN_var_cte_600 )

        when 5
          # at line 96:4: CTE_BOLEANA
          match( CTE_BOLEANA, TOKENS_FOLLOWING_CTE_BOLEANA_IN_var_cte_605 )

        when 6
          # at line 97:4: CTE_CHAR
          match( CTE_CHAR, TOKENS_FOLLOWING_CTE_CHAR_IN_var_cte_610 )

        when 7
          # at line 98:4: 'este'
          match( T__43, TOKENS_FOLLOWING_T__43_IN_var_cte_615 )

        when 8
          # at line 99:4: 'nuevo' CLASE_OB
          match( T__52, TOKENS_FOLLOWING_T__52_IN_var_cte_620 )
          match( CLASE_OB, TOKENS_FOLLOWING_CLASE_OB_IN_var_cte_622 )

        end
        # at line 99:23: ( invocacion )?
        alt_28 = 2
        look_28_0 = @input.peek( 1 )

        if ( look_28_0 == T__44 )
          alt_28 = 1
        end
        case alt_28
        when 1
          # at line 99:23: invocacion
          @state.following.push( TOKENS_FOLLOWING_invocacion_IN_var_cte_626 )
          invocacion
          @state.following.pop

        end

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 25 )

      end
      
      return 
    end


    # 
    # parser rule invocacion
    # 
    # (in Pohua.g)
    # 102:1: invocacion : '.' ID '(' ( expresion ( ',' expresion )* )? ')' ( invocacion )? ';' ;
    # 
    def invocacion
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 26 )

      begin
        # at line 103:4: '.' ID '(' ( expresion ( ',' expresion )* )? ')' ( invocacion )? ';'
        match( T__44, TOKENS_FOLLOWING_T__44_IN_invocacion_638 )
        match( ID, TOKENS_FOLLOWING_ID_IN_invocacion_640 )
        match( T__40, TOKENS_FOLLOWING_T__40_IN_invocacion_642 )
        # at line 103:15: ( expresion ( ',' expresion )* )?
        alt_30 = 2
        look_30_0 = @input.peek( 1 )

        if ( look_30_0 == ID || look_30_0 == OPERADOR_TERMINO || look_30_0.between?( CTE_ENTERA, CTE_CHAR ) || look_30_0 == T__40 || look_30_0 == T__43 || look_30_0 == T__52 )
          alt_30 = 1
        end
        case alt_30
        when 1
          # at line 103:17: expresion ( ',' expresion )*
          @state.following.push( TOKENS_FOLLOWING_expresion_IN_invocacion_646 )
          expresion
          @state.following.pop
          # at line 103:27: ( ',' expresion )*
          while true # decision 29
            alt_29 = 2
            look_29_0 = @input.peek( 1 )

            if ( look_29_0 == T__41 )
              alt_29 = 1

            end
            case alt_29
            when 1
              # at line 103:29: ',' expresion
              match( T__41, TOKENS_FOLLOWING_T__41_IN_invocacion_650 )
              @state.following.push( TOKENS_FOLLOWING_expresion_IN_invocacion_652 )
              expresion
              @state.following.pop

            else
              break # out of loop for decision 29
            end
          end # loop for decision 29

        end
        match( T__42, TOKENS_FOLLOWING_T__42_IN_invocacion_660 )
        # at line 103:53: ( invocacion )?
        alt_31 = 2
        look_31_0 = @input.peek( 1 )

        if ( look_31_0 == T__44 )
          alt_31 = 1
        end
        case alt_31
        when 1
          # at line 103:53: invocacion
          @state.following.push( TOKENS_FOLLOWING_invocacion_IN_invocacion_662 )
          invocacion
          @state.following.pop

        end
        match( T__33, TOKENS_FOLLOWING_T__33_IN_invocacion_665 )

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 26 )

      end
      
      return 
    end



    TOKENS_FOLLOWING_clase_IN_programa_12 = Set[ 25 ]
    TOKENS_FOLLOWING_clase_principal_IN_programa_16 = Set[ 1 ]
    TOKENS_FOLLOWING_T__25_IN_clase_27 = Set[ 4 ]
    TOKENS_FOLLOWING_CLASE_OB_IN_clase_29 = Set[ 26, 27 ]
    TOKENS_FOLLOWING_T__26_IN_clase_32 = Set[ 4 ]
    TOKENS_FOLLOWING_CLASE_OB_IN_clase_34 = Set[ 27 ]
    TOKENS_FOLLOWING_T__27_IN_clase_38 = Set[ 4, 28, 30, 35, 36, 37, 38, 39 ]
    TOKENS_FOLLOWING_dec_variable_IN_clase_40 = Set[ 4, 28, 30, 35, 36, 37, 38, 39 ]
    TOKENS_FOLLOWING_metodo_IN_clase_43 = Set[ 28, 30 ]
    TOKENS_FOLLOWING_T__28_IN_clase_46 = Set[ 1 ]
    TOKENS_FOLLOWING_T__25_IN_clase_principal_55 = Set[ 29 ]
    TOKENS_FOLLOWING_T__29_IN_clase_principal_57 = Set[ 27 ]
    TOKENS_FOLLOWING_T__27_IN_clase_principal_59 = Set[ 30 ]
    TOKENS_FOLLOWING_met_principal_IN_clase_principal_61 = Set[ 28, 30 ]
    TOKENS_FOLLOWING_metodo_IN_clase_principal_63 = Set[ 28, 30 ]
    TOKENS_FOLLOWING_T__28_IN_clase_principal_66 = Set[ 1 ]
    TOKENS_FOLLOWING_T__30_IN_met_principal_78 = Set[ 31 ]
    TOKENS_FOLLOWING_T__31_IN_met_principal_80 = Set[ 32 ]
    TOKENS_FOLLOWING_T__32_IN_met_principal_82 = Set[ 27 ]
    TOKENS_FOLLOWING_T__27_IN_met_principal_84 = Set[ 4, 5, 28, 35, 36, 37, 38, 39, 43, 46, 48, 50, 51 ]
    TOKENS_FOLLOWING_bloque_IN_met_principal_86 = Set[ 4, 5, 28, 35, 36, 37, 38, 39, 43, 46, 48, 50, 51 ]
    TOKENS_FOLLOWING_T__28_IN_met_principal_89 = Set[ 1 ]
    TOKENS_FOLLOWING_dec_variable_IN_bloque_99 = Set[ 1 ]
    TOKENS_FOLLOWING_estatuto_IN_bloque_104 = Set[ 1 ]
    TOKENS_FOLLOWING_tipo_IN_dec_variable_116 = Set[ 5 ]
    TOKENS_FOLLOWING_ID_IN_dec_variable_118 = Set[ 33 ]
    TOKENS_FOLLOWING_T__33_IN_dec_variable_120 = Set[ 1 ]
    TOKENS_FOLLOWING_T__30_IN_metodo_130 = Set[ 4, 31, 35, 36, 37, 38, 39 ]
    TOKENS_FOLLOWING_met_tipado_IN_metodo_133 = Set[ 1 ]
    TOKENS_FOLLOWING_met_vacuo_IN_metodo_137 = Set[ 1 ]
    TOKENS_FOLLOWING_tipo_IN_met_tipado_148 = Set[ 5 ]
    TOKENS_FOLLOWING_ID_IN_met_tipado_150 = Set[ 27, 40 ]
    TOKENS_FOLLOWING_parametro_IN_met_tipado_152 = Set[ 27 ]
    TOKENS_FOLLOWING_T__27_IN_met_tipado_155 = Set[ 4, 5, 34, 35, 36, 37, 38, 39, 43, 46, 48, 50, 51 ]
    TOKENS_FOLLOWING_bloque_IN_met_tipado_157 = Set[ 4, 5, 34, 35, 36, 37, 38, 39, 43, 46, 48, 50, 51 ]
    TOKENS_FOLLOWING_T__34_IN_met_tipado_160 = Set[ 5, 8, 10, 11, 12, 13, 14, 40, 43, 52 ]
    TOKENS_FOLLOWING_expresion_IN_met_tipado_162 = Set[ 28 ]
    TOKENS_FOLLOWING_T__28_IN_met_tipado_164 = Set[ 1 ]
    TOKENS_FOLLOWING_T__31_IN_met_vacuo_176 = Set[ 5 ]
    TOKENS_FOLLOWING_ID_IN_met_vacuo_178 = Set[ 27, 40 ]
    TOKENS_FOLLOWING_parametro_IN_met_vacuo_180 = Set[ 27 ]
    TOKENS_FOLLOWING_T__27_IN_met_vacuo_183 = Set[ 4, 5, 28, 35, 36, 37, 38, 39, 43, 46, 48, 50, 51 ]
    TOKENS_FOLLOWING_bloque_IN_met_vacuo_185 = Set[ 4, 5, 28, 35, 36, 37, 38, 39, 43, 46, 48, 50, 51 ]
    TOKENS_FOLLOWING_T__28_IN_met_vacuo_188 = Set[ 1 ]
    TOKENS_FOLLOWING_set_IN_tipo_0 = Set[ 1 ]
    TOKENS_FOLLOWING_T__40_IN_parametro_236 = Set[ 4, 35, 36, 37, 38, 39 ]
    TOKENS_FOLLOWING_tipo_IN_parametro_238 = Set[ 5 ]
    TOKENS_FOLLOWING_ID_IN_parametro_240 = Set[ 41, 42 ]
    TOKENS_FOLLOWING_T__41_IN_parametro_244 = Set[ 4, 35, 36, 37, 38, 39 ]
    TOKENS_FOLLOWING_tipo_IN_parametro_246 = Set[ 5 ]
    TOKENS_FOLLOWING_ID_IN_parametro_248 = Set[ 41, 42 ]
    TOKENS_FOLLOWING_T__42_IN_parametro_252 = Set[ 1 ]
    TOKENS_FOLLOWING_asignacion_IN_estatuto_264 = Set[ 1 ]
    TOKENS_FOLLOWING_condicion_IN_estatuto_269 = Set[ 1 ]
    TOKENS_FOLLOWING_escritura_IN_estatuto_274 = Set[ 1 ]
    TOKENS_FOLLOWING_ciclo_IN_estatuto_279 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_estatuto_284 = Set[ 44 ]
    TOKENS_FOLLOWING_invocacion_IN_estatuto_286 = Set[ 1 ]
    TOKENS_FOLLOWING_set_IN_asignacion_299 = Set[ 44, 45 ]
    TOKENS_FOLLOWING_T__44_IN_asignacion_309 = Set[ 5 ]
    TOKENS_FOLLOWING_ID_IN_asignacion_311 = Set[ 45 ]
    TOKENS_FOLLOWING_T__45_IN_asignacion_315 = Set[ 5, 8, 10, 11, 12, 13, 14, 40, 43, 49, 52 ]
    TOKENS_FOLLOWING_expresion_IN_asignacion_320 = Set[ 33 ]
    TOKENS_FOLLOWING_lectura_IN_asignacion_324 = Set[ 33 ]
    TOKENS_FOLLOWING_T__33_IN_asignacion_328 = Set[ 1 ]
    TOKENS_FOLLOWING_T__46_IN_condicion_338 = Set[ 40 ]
    TOKENS_FOLLOWING_T__40_IN_condicion_340 = Set[ 5, 8, 10, 11, 12, 13, 14, 40, 43, 52 ]
    TOKENS_FOLLOWING_expresion_IN_condicion_342 = Set[ 42 ]
    TOKENS_FOLLOWING_T__42_IN_condicion_344 = Set[ 27 ]
    TOKENS_FOLLOWING_T__27_IN_condicion_346 = Set[ 4, 5, 28, 35, 36, 37, 38, 39, 43, 46, 47, 48, 50, 51 ]
    TOKENS_FOLLOWING_estatuto_IN_condicion_348 = Set[ 4, 5, 28, 35, 36, 37, 38, 39, 43, 46, 47, 48, 50, 51 ]
    TOKENS_FOLLOWING_T__47_IN_condicion_353 = Set[ 4, 5, 35, 36, 37, 38, 39, 43, 46, 48, 50, 51 ]
    TOKENS_FOLLOWING_estatuto_IN_condicion_355 = Set[ 28 ]
    TOKENS_FOLLOWING_T__28_IN_condicion_360 = Set[ 1 ]
    TOKENS_FOLLOWING_T__48_IN_escritura_372 = Set[ 40 ]
    TOKENS_FOLLOWING_T__40_IN_escritura_374 = Set[ 5, 8, 10, 11, 12, 13, 14, 40, 43, 52 ]
    TOKENS_FOLLOWING_expresion_IN_escritura_376 = Set[ 41, 42 ]
    TOKENS_FOLLOWING_T__41_IN_escritura_380 = Set[ 5, 8, 10, 11, 12, 13, 14, 40, 43, 52 ]
    TOKENS_FOLLOWING_expresion_IN_escritura_382 = Set[ 41, 42 ]
    TOKENS_FOLLOWING_T__42_IN_escritura_387 = Set[ 33 ]
    TOKENS_FOLLOWING_T__33_IN_escritura_389 = Set[ 1 ]
    TOKENS_FOLLOWING_T__49_IN_lectura_400 = Set[ 40 ]
    TOKENS_FOLLOWING_T__40_IN_lectura_402 = Set[ 42 ]
    TOKENS_FOLLOWING_T__42_IN_lectura_404 = Set[ 1 ]
    TOKENS_FOLLOWING_mientras_IN_ciclo_415 = Set[ 1 ]
    TOKENS_FOLLOWING_para_IN_ciclo_420 = Set[ 1 ]
    TOKENS_FOLLOWING_T__50_IN_mientras_432 = Set[ 40 ]
    TOKENS_FOLLOWING_T__40_IN_mientras_434 = Set[ 5, 8, 10, 11, 12, 13, 14, 40, 43, 52 ]
    TOKENS_FOLLOWING_expresion_IN_mientras_436 = Set[ 42 ]
    TOKENS_FOLLOWING_T__42_IN_mientras_438 = Set[ 27 ]
    TOKENS_FOLLOWING_T__27_IN_mientras_440 = Set[ 4, 5, 35, 36, 37, 38, 39, 43, 46, 48, 50, 51 ]
    TOKENS_FOLLOWING_estatuto_IN_mientras_442 = Set[ 28 ]
    TOKENS_FOLLOWING_T__28_IN_mientras_444 = Set[ 1 ]
    TOKENS_FOLLOWING_T__51_IN_para_454 = Set[ 40 ]
    TOKENS_FOLLOWING_T__40_IN_para_456 = Set[ 5, 43 ]
    TOKENS_FOLLOWING_asignacion_IN_para_458 = Set[ 33 ]
    TOKENS_FOLLOWING_T__33_IN_para_460 = Set[ 5, 8, 10, 11, 12, 13, 14, 40, 43, 52 ]
    TOKENS_FOLLOWING_expresion_IN_para_462 = Set[ 33 ]
    TOKENS_FOLLOWING_T__33_IN_para_464 = Set[ 5, 8, 10, 11, 12, 13, 14, 40, 43, 52 ]
    TOKENS_FOLLOWING_expresion_IN_para_466 = Set[ 33 ]
    TOKENS_FOLLOWING_T__33_IN_para_468 = Set[ 42 ]
    TOKENS_FOLLOWING_T__42_IN_para_470 = Set[ 4, 5, 35, 36, 37, 38, 39, 43, 46, 48, 50, 51 ]
    TOKENS_FOLLOWING_estatuto_IN_para_472 = Set[ 28 ]
    TOKENS_FOLLOWING_T__28_IN_para_474 = Set[ 1 ]
    TOKENS_FOLLOWING_e_IN_expresion_483 = Set[ 1, 6 ]
    TOKENS_FOLLOWING_OPERADOR_LOGICO_IN_expresion_487 = Set[ 5, 8, 10, 11, 12, 13, 14, 40, 43, 52 ]
    TOKENS_FOLLOWING_e_IN_expresion_489 = Set[ 1 ]
    TOKENS_FOLLOWING_exp_IN_e_502 = Set[ 1, 7 ]
    TOKENS_FOLLOWING_OPERADOR_COMPARACION_IN_e_506 = Set[ 5, 8, 10, 11, 12, 13, 14, 40, 43, 52 ]
    TOKENS_FOLLOWING_exp_IN_e_508 = Set[ 1 ]
    TOKENS_FOLLOWING_termino_IN_exp_522 = Set[ 1, 8 ]
    TOKENS_FOLLOWING_OPERADOR_TERMINO_IN_exp_526 = Set[ 5, 8, 10, 11, 12, 13, 14, 40, 43, 52 ]
    TOKENS_FOLLOWING_exp_IN_exp_528 = Set[ 1, 8 ]
    TOKENS_FOLLOWING_factor_IN_termino_540 = Set[ 1, 9 ]
    TOKENS_FOLLOWING_OPERADOR_FACTOR_IN_termino_544 = Set[ 5, 8, 10, 11, 12, 13, 14, 40, 43, 52 ]
    TOKENS_FOLLOWING_termino_IN_termino_546 = Set[ 1, 9 ]
    TOKENS_FOLLOWING_T__40_IN_factor_559 = Set[ 5, 8, 10, 11, 12, 13, 14, 40, 43, 52 ]
    TOKENS_FOLLOWING_expresion_IN_factor_561 = Set[ 42 ]
    TOKENS_FOLLOWING_T__42_IN_factor_563 = Set[ 1 ]
    TOKENS_FOLLOWING_OPERADOR_TERMINO_IN_factor_569 = Set[ 5, 8, 10, 11, 12, 13, 14, 40, 43, 52 ]
    TOKENS_FOLLOWING_var_cte_IN_factor_572 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_var_cte_585 = Set[ 1, 44 ]
    TOKENS_FOLLOWING_CTE_ENTERA_IN_var_cte_590 = Set[ 1, 44 ]
    TOKENS_FOLLOWING_CTE_FLOTANTE_IN_var_cte_595 = Set[ 1, 44 ]
    TOKENS_FOLLOWING_CTE_STRING_IN_var_cte_600 = Set[ 1, 44 ]
    TOKENS_FOLLOWING_CTE_BOLEANA_IN_var_cte_605 = Set[ 1, 44 ]
    TOKENS_FOLLOWING_CTE_CHAR_IN_var_cte_610 = Set[ 1, 44 ]
    TOKENS_FOLLOWING_T__43_IN_var_cte_615 = Set[ 1, 44 ]
    TOKENS_FOLLOWING_T__52_IN_var_cte_620 = Set[ 4 ]
    TOKENS_FOLLOWING_CLASE_OB_IN_var_cte_622 = Set[ 1, 44 ]
    TOKENS_FOLLOWING_invocacion_IN_var_cte_626 = Set[ 1 ]
    TOKENS_FOLLOWING_T__44_IN_invocacion_638 = Set[ 5 ]
    TOKENS_FOLLOWING_ID_IN_invocacion_640 = Set[ 40 ]
    TOKENS_FOLLOWING_T__40_IN_invocacion_642 = Set[ 5, 8, 10, 11, 12, 13, 14, 40, 42, 43, 52 ]
    TOKENS_FOLLOWING_expresion_IN_invocacion_646 = Set[ 41, 42 ]
    TOKENS_FOLLOWING_T__41_IN_invocacion_650 = Set[ 5, 8, 10, 11, 12, 13, 14, 40, 43, 52 ]
    TOKENS_FOLLOWING_expresion_IN_invocacion_652 = Set[ 41, 42 ]
    TOKENS_FOLLOWING_T__42_IN_invocacion_660 = Set[ 33, 44 ]
    TOKENS_FOLLOWING_invocacion_IN_invocacion_662 = Set[ 33 ]
    TOKENS_FOLLOWING_T__33_IN_invocacion_665 = Set[ 1 ]

  end # class Parser < ANTLR3::Parser

  at_exit { Parser.main( ARGV ) } if __FILE__ == $0
end

