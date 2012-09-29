#!/usr/bin/env ruby
#
# Pohua.g
# --
# Generated using ANTLR version: 3.2.1-SNAPSHOT Jul 31, 2010 19:34:52
# Ruby runtime library version: 1.8.11
# Input grammar file: Pohua.g
# Generated at: 2012-09-28 21:41:06
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
                   :T__27 => 27, :T__26 => 26, :T__25 => 25, :DIGITO => 17, 
                   :CTE_ENTERA => 10, :OCTAL_ESC => 24, :COMENTARIOS => 20, 
                   :CTE_FLOTANTE => 11, :ID => 5, :EOF => -1, :T__51 => 51, 
                   :ESC_SEQ => 19, :T__52 => 52, :T__53 => 53, :OPERADOR_LOGICO => 6, 
                   :OPERADOR_FACTOR => 9, :T__50 => 50, :T__42 => 42, :T__43 => 43, 
                   :T__40 => 40, :T__41 => 41, :T__46 => 46, :T__47 => 47, 
                   :T__44 => 44, :T__45 => 45, :T__48 => 48, :T__49 => 49, 
                   :OPERADOR_COMPARACION => 7, :UNICODE_ESC => 23, :LETRA_MIN => 15, 
                   :EXPONENTE => 18, :HEX_DIGIT => 22, :WHITESPACE => 21, 
                   :T__30 => 30, :T__31 => 31, :CTE_STRING => 12, :T__32 => 32, 
                   :T__33 => 33, :T__34 => 34, :T__35 => 35, :T__36 => 36, 
                   :T__37 => 37, :OPERADOR_TERMINO => 8, :T__38 => 38, :T__39 => 39, 
                   :CTE_BOLEANA => 13, :LETRA_MAY => 16 )
    
  end


  class Lexer < ANTLR3::Lexer
    @grammar_home = Pohua
    include TokenData

    
    begin
      generated_using( "Pohua.g", "3.2.1-SNAPSHOT Jul 31, 2010 19:34:52", "1.8.11" )
    rescue NoMethodError => error
      # ignore
    end
    
    RULE_NAMES   = [ "T__25", "T__26", "T__27", "T__28", "T__29", "T__30", 
                     "T__31", "T__32", "T__33", "T__34", "T__35", "T__36", 
                     "T__37", "T__38", "T__39", "T__40", "T__41", "T__42", 
                     "T__43", "T__44", "T__45", "T__46", "T__47", "T__48", 
                     "T__49", "T__50", "T__51", "T__52", "T__53", "ID", 
                     "CTE_ENTERA", "CTE_FLOTANTE", "CTE_STRING", "CTE_CHAR", 
                     "CTE_BOLEANA", "CLASE_OB", "COMENTARIOS", "WHITESPACE", 
                     "OPERADOR_FACTOR", "OPERADOR_TERMINO", "OPERADOR_LOGICO", 
                     "OPERADOR_COMPARACION", "LETRA_MAY", "LETRA_MIN", "DIGITO", 
                     "EXPONENTE", "HEX_DIGIT", "ESC_SEQ", "OCTAL_ESC", "UNICODE_ESC" ].freeze
    RULE_METHODS = [ :t__25!, :t__26!, :t__27!, :t__28!, :t__29!, :t__30!, 
                     :t__31!, :t__32!, :t__33!, :t__34!, :t__35!, :t__36!, 
                     :t__37!, :t__38!, :t__39!, :t__40!, :t__41!, :t__42!, 
                     :t__43!, :t__44!, :t__45!, :t__46!, :t__47!, :t__48!, 
                     :t__49!, :t__50!, :t__51!, :t__52!, :t__53!, :id!, 
                     :cte_entera!, :cte_flotante!, :cte_string!, :cte_char!, 
                     :cte_boleana!, :clase_ob!, :comentarios!, :whitespace!, 
                     :operador_factor!, :operador_termino!, :operador_logico!, 
                     :operador_comparacion!, :letra_may!, :letra_min!, :digito!, 
                     :exponente!, :hex_digit!, :esc_seq!, :octal_esc!, :unicode_esc! ].freeze

    
    def initialize( input=nil, options = {} )
      super( input, options )

    end
    
    
    # - - - - - - - - - - - lexer rules - - - - - - - - - - - -
    # lexer rule t__25! (T__25)
    # (in Pohua.g)
    def t__25!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 1 )

      type = T__25
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 3:9: 'clase'
      match( "clase" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 1 )

    end

    # lexer rule t__26! (T__26)
    # (in Pohua.g)
    def t__26!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 2 )

      type = T__26
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 4:9: 'extiende'
      match( "extiende" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 2 )

    end

    # lexer rule t__27! (T__27)
    # (in Pohua.g)
    def t__27!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 3 )

      type = T__27
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 5:9: ':'
      match( 0x3a )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 3 )

    end

    # lexer rule t__28! (T__28)
    # (in Pohua.g)
    def t__28!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 4 )

      type = T__28
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 6:9: 'fin'
      match( "fin" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 4 )

    end

    # lexer rule t__29! (T__29)
    # (in Pohua.g)
    def t__29!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 5 )

      type = T__29
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 7:9: 'Principal'
      match( "Principal" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 5 )

    end

    # lexer rule t__30! (T__30)
    # (in Pohua.g)
    def t__30!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 6 )

      type = T__30
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 8:9: 'metodo'
      match( "metodo" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 6 )

    end

    # lexer rule t__31! (T__31)
    # (in Pohua.g)
    def t__31!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 7 )

      type = T__31
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 9:9: 'vacuo'
      match( "vacuo" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 7 )

    end

    # lexer rule t__32! (T__32)
    # (in Pohua.g)
    def t__32!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 8 )

      type = T__32
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 10:9: 'principal'
      match( "principal" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 8 )

    end

    # lexer rule t__33! (T__33)
    # (in Pohua.g)
    def t__33!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 9 )

      type = T__33
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 11:9: ';'
      match( 0x3b )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 9 )

    end

    # lexer rule t__34! (T__34)
    # (in Pohua.g)
    def t__34!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 10 )

      type = T__34
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 12:9: 'regresa'
      match( "regresa" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 10 )

    end

    # lexer rule t__35! (T__35)
    # (in Pohua.g)
    def t__35!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 11 )

      type = T__35
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 13:9: 'ent'
      match( "ent" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 11 )

    end

    # lexer rule t__36! (T__36)
    # (in Pohua.g)
    def t__36!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 12 )

      type = T__36
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 14:9: 'flot'
      match( "flot" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 12 )

    end

    # lexer rule t__37! (T__37)
    # (in Pohua.g)
    def t__37!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 13 )

      type = T__37
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 15:9: 'string'
      match( "string" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 13 )

    end

    # lexer rule t__38! (T__38)
    # (in Pohua.g)
    def t__38!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 14 )

      type = T__38
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 16:9: 'bol'
      match( "bol" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 14 )

    end

    # lexer rule t__39! (T__39)
    # (in Pohua.g)
    def t__39!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 15 )

      type = T__39
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 17:9: 'char'
      match( "char" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 15 )

    end

    # lexer rule t__40! (T__40)
    # (in Pohua.g)
    def t__40!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 16 )

      type = T__40
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 18:9: '('
      match( 0x28 )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 16 )

    end

    # lexer rule t__41! (T__41)
    # (in Pohua.g)
    def t__41!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 17 )

      type = T__41
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 19:9: ','
      match( 0x2c )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 17 )

    end

    # lexer rule t__42! (T__42)
    # (in Pohua.g)
    def t__42!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 18 )

      type = T__42
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 20:9: ')'
      match( 0x29 )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 18 )

    end

    # lexer rule t__43! (T__43)
    # (in Pohua.g)
    def t__43!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 19 )

      type = T__43
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 21:9: '.'
      match( 0x2e )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 19 )

    end

    # lexer rule t__44! (T__44)
    # (in Pohua.g)
    def t__44!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 20 )

      type = T__44
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 22:9: '='
      match( 0x3d )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 20 )

    end

    # lexer rule t__45! (T__45)
    # (in Pohua.g)
    def t__45!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 21 )

      type = T__45
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 23:9: 'si?'
      match( "si?" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 21 )

    end

    # lexer rule t__46! (T__46)
    # (in Pohua.g)
    def t__46!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 22 )

      type = T__46
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 24:9: 'sino'
      match( "sino" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 22 )

    end

    # lexer rule t__47! (T__47)
    # (in Pohua.g)
    def t__47!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 23 )

      type = T__47
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 25:9: 'imprime'
      match( "imprime" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 23 )

    end

    # lexer rule t__48! (T__48)
    # (in Pohua.g)
    def t__48!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 24 )

      type = T__48
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 26:9: '+'
      match( 0x2b )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 24 )

    end

    # lexer rule t__49! (T__49)
    # (in Pohua.g)
    def t__49!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 25 )

      type = T__49
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 27:9: 'lee'
      match( "lee" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 25 )

    end

    # lexer rule t__50! (T__50)
    # (in Pohua.g)
    def t__50!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 26 )

      type = T__50
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 28:9: 'mientras'
      match( "mientras" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 26 )

    end

    # lexer rule t__51! (T__51)
    # (in Pohua.g)
    def t__51!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 27 )

      type = T__51
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 29:9: 'para'
      match( "para" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 27 )

    end

    # lexer rule t__52! (T__52)
    # (in Pohua.g)
    def t__52!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 28 )

      type = T__52
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 30:9: 'este'
      match( "este" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 28 )

    end

    # lexer rule t__53! (T__53)
    # (in Pohua.g)
    def t__53!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 29 )

      type = T__53
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 31:9: 'nuevo'
      match( "nuevo" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 29 )

    end

    # lexer rule id! (ID)
    # (in Pohua.g)
    def id!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 30 )

      type = ID
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 109:6: LETRA_MIN ( LETRA_MIN | LETRA_MAY | '_' | DIGITO )*
      letra_min!
      # at line 109:17: ( LETRA_MIN | LETRA_MAY | '_' | DIGITO )*
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
          # at line 109:19: LETRA_MIN
          letra_min!

        when 2
          # at line 109:31: LETRA_MAY
          letra_may!

        when 3
          # at line 109:43: '_'
          match( 0x5f )

        when 4
          # at line 109:49: DIGITO
          digito!

        else
          break # out of loop for decision 1
        end
      end # loop for decision 1

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 30 )

    end

    # lexer rule cte_entera! (CTE_ENTERA)
    # (in Pohua.g)
    def cte_entera!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 31 )

      type = CTE_ENTERA
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 111:13: ( DIGITO )+
      # at file 111:13: ( DIGITO )+
      match_count_2 = 0
      while true
        alt_2 = 2
        look_2_0 = @input.peek( 1 )

        if ( look_2_0.between?( 0x30, 0x39 ) )
          alt_2 = 1

        end
        case alt_2
        when 1
          # at line 111:13: DIGITO
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
      # trace_out( __method__, 31 )

    end

    # lexer rule cte_flotante! (CTE_FLOTANTE)
    # (in Pohua.g)
    def cte_flotante!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 32 )

      type = CTE_FLOTANTE
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 113:15: CTE_ENTERA '.' CTE_ENTERA ( EXPONENTE )?
      cte_entera!
      match( 0x2e )
      cte_entera!
      # at line 113:41: ( EXPONENTE )?
      alt_3 = 2
      look_3_0 = @input.peek( 1 )

      if ( look_3_0 == 0x45 || look_3_0 == 0x65 )
        alt_3 = 1
      end
      case alt_3
      when 1
        # at line 113:42: EXPONENTE
        exponente!

      end

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 32 )

    end

    # lexer rule cte_string! (CTE_STRING)
    # (in Pohua.g)
    def cte_string!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 33 )

      type = CTE_STRING
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 116:8: '\"' ( ESC_SEQ | ~ ( '\\\\' | '\"' ) )* '\"'
      match( 0x22 )
      # at line 116:12: ( ESC_SEQ | ~ ( '\\\\' | '\"' ) )*
      while true # decision 4
        alt_4 = 3
        look_4_0 = @input.peek( 1 )

        if ( look_4_0 == 0x5c )
          alt_4 = 1
        elsif ( look_4_0.between?( 0x0, 0x21 ) || look_4_0.between?( 0x23, 0x5b ) || look_4_0.between?( 0x5d, 0xffff ) )
          alt_4 = 2

        end
        case alt_4
        when 1
          # at line 116:14: ESC_SEQ
          esc_seq!

        when 2
          # at line 116:24: ~ ( '\\\\' | '\"' )
          if @input.peek( 1 ).between?( 0x0, 0x21 ) || @input.peek( 1 ).between?( 0x23, 0x5b ) || @input.peek( 1 ).between?( 0x5d, 0xff )
            @input.consume
          else
            mse = MismatchedSet( nil )
            recover mse
            raise mse
          end



        else
          break # out of loop for decision 4
        end
      end # loop for decision 4
      match( 0x22 )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 33 )

    end

    # lexer rule cte_char! (CTE_CHAR)
    # (in Pohua.g)
    def cte_char!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 34 )

      type = CTE_CHAR
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 119:12: '\\'' ( ESC_SEQ | ~ ( '\\'' | '\\\\' ) ) '\\''
      match( 0x27 )
      # at line 119:17: ( ESC_SEQ | ~ ( '\\'' | '\\\\' ) )
      alt_5 = 2
      look_5_0 = @input.peek( 1 )

      if ( look_5_0 == 0x5c )
        alt_5 = 1
      elsif ( look_5_0.between?( 0x0, 0x26 ) || look_5_0.between?( 0x28, 0x5b ) || look_5_0.between?( 0x5d, 0xffff ) )
        alt_5 = 2
      else
        raise NoViableAlternative( "", 5, 0 )
      end
      case alt_5
      when 1
        # at line 119:19: ESC_SEQ
        esc_seq!

      when 2
        # at line 119:29: ~ ( '\\'' | '\\\\' )
        if @input.peek( 1 ).between?( 0x0, 0x26 ) || @input.peek( 1 ).between?( 0x28, 0x5b ) || @input.peek( 1 ).between?( 0x5d, 0xff )
          @input.consume
        else
          mse = MismatchedSet( nil )
          recover mse
          raise mse
        end



      end
      match( 0x27 )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 34 )

    end

    # lexer rule cte_boleana! (CTE_BOLEANA)
    # (in Pohua.g)
    def cte_boleana!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 35 )

      type = CTE_BOLEANA
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 122:14: ( 'SI' | 'NO' )
      # at line 122:14: ( 'SI' | 'NO' )
      alt_6 = 2
      look_6_0 = @input.peek( 1 )

      if ( look_6_0 == 0x53 )
        alt_6 = 1
      elsif ( look_6_0 == 0x4e )
        alt_6 = 2
      else
        raise NoViableAlternative( "", 6, 0 )
      end
      case alt_6
      when 1
        # at line 122:16: 'SI'
        match( "SI" )

      when 2
        # at line 122:23: 'NO'
        match( "NO" )

      end

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 35 )

    end

    # lexer rule clase_ob! (CLASE_OB)
    # (in Pohua.g)
    def clase_ob!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 36 )

      type = CLASE_OB
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 124:11: LETRA_MAY ( LETRA_MAY | LETRA_MIN | DIGITO )*
      letra_may!
      # at line 124:21: ( LETRA_MAY | LETRA_MIN | DIGITO )*
      while true # decision 7
        alt_7 = 4
        case look_7 = @input.peek( 1 )
        when 0x41, 0x42, 0x43, 0x44, 0x45, 0x46, 0x47, 0x48, 0x49, 0x4a, 0x4b, 0x4c, 0x4d, 0x4e, 0x4f, 0x50, 0x51, 0x52, 0x53, 0x54, 0x55, 0x56, 0x57, 0x58, 0x59, 0x5a then alt_7 = 1
        when 0x61, 0x62, 0x63, 0x64, 0x65, 0x66, 0x67, 0x68, 0x69, 0x6a, 0x6b, 0x6c, 0x6d, 0x6e, 0x6f, 0x70, 0x71, 0x72, 0x73, 0x74, 0x75, 0x76, 0x77, 0x78, 0x79, 0x7a then alt_7 = 2
        when 0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x38, 0x39 then alt_7 = 3
        end
        case alt_7
        when 1
          # at line 124:23: LETRA_MAY
          letra_may!

        when 2
          # at line 124:35: LETRA_MIN
          letra_min!

        when 3
          # at line 124:47: DIGITO
          digito!

        else
          break # out of loop for decision 7
        end
      end # loop for decision 7

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 36 )

    end

    # lexer rule comentarios! (COMENTARIOS)
    # (in Pohua.g)
    def comentarios!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 37 )

      type = COMENTARIOS
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 127:9: '#' ( options {greedy=false; } : . )* '#'
      match( 0x23 )
      # at line 127:13: ( options {greedy=false; } : . )*
      while true # decision 8
        alt_8 = 2
        look_8_0 = @input.peek( 1 )

        if ( look_8_0 == 0x23 )
          alt_8 = 2
        elsif ( look_8_0.between?( 0x0, 0x22 ) || look_8_0.between?( 0x24, 0xffff ) )
          alt_8 = 1

        end
        case alt_8
        when 1
          # at line 127:41: .
          match_any

        else
          break # out of loop for decision 8
        end
      end # loop for decision 8
      match( 0x23 )
      # --> action
      channel=HIDDEN;
      # <-- action

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 37 )

    end

    # lexer rule whitespace! (WHITESPACE)
    # (in Pohua.g)
    def whitespace!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 38 )

      type = WHITESPACE
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 130:15: ( ' ' | '\\t' | '\\r' | '\\n' )
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
      # trace_out( __method__, 38 )

    end

    # lexer rule operador_factor! (OPERADOR_FACTOR)
    # (in Pohua.g)
    def operador_factor!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 39 )

      type = OPERADOR_FACTOR
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
      # trace_out( __method__, 39 )

    end

    # lexer rule operador_termino! (OPERADOR_TERMINO)
    # (in Pohua.g)
    def operador_termino!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 40 )

      type = OPERADOR_TERMINO
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
      # trace_out( __method__, 40 )

    end

    # lexer rule operador_logico! (OPERADOR_LOGICO)
    # (in Pohua.g)
    def operador_logico!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 41 )

      type = OPERADOR_LOGICO
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 142:2: ( '&&' | '!=' )
      alt_9 = 2
      look_9_0 = @input.peek( 1 )

      if ( look_9_0 == 0x26 )
        alt_9 = 1
      elsif ( look_9_0 == 0x21 )
        alt_9 = 2
      else
        raise NoViableAlternative( "", 9, 0 )
      end
      case alt_9
      when 1
        # at line 142:4: '&&'
        match( "&&" )

      when 2
        # at line 143:4: '!='
        match( "!=" )

      end
      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 41 )

    end

    # lexer rule operador_comparacion! (OPERADOR_COMPARACION)
    # (in Pohua.g)
    def operador_comparacion!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 42 )

      type = OPERADOR_COMPARACION
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 146:21: ( '==' | '<' | '>' | '!=' )
      alt_10 = 4
      case look_10 = @input.peek( 1 )
      when 0x3d then alt_10 = 1
      when 0x3c then alt_10 = 2
      when 0x3e then alt_10 = 3
      when 0x21 then alt_10 = 4
      else
        raise NoViableAlternative( "", 10, 0 )
      end
      case alt_10
      when 1
        # at line 146:23: '=='
        match( "==" )

      when 2
        # at line 146:30: '<'
        match( 0x3c )

      when 3
        # at line 146:36: '>'
        match( 0x3e )

      when 4
        # at line 146:42: '!='
        match( "!=" )

      end
      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 42 )

    end

    # lexer rule letra_may! (LETRA_MAY)
    # (in Pohua.g)
    def letra_may!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 43 )

      
      # - - - - main rule block - - - -
      # at line 149:13: ( 'A' .. 'Z' )
      # at line 149:13: ( 'A' .. 'Z' )
      # at line 149:15: 'A' .. 'Z'
      match_range( 0x41, 0x5a )


    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 43 )

    end

    # lexer rule letra_min! (LETRA_MIN)
    # (in Pohua.g)
    def letra_min!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 44 )

      
      # - - - - main rule block - - - -
      # at line 152:13: ( 'a' .. 'z' )
      # at line 152:13: ( 'a' .. 'z' )
      # at line 152:15: 'a' .. 'z'
      match_range( 0x61, 0x7a )


    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 44 )

    end

    # lexer rule digito! (DIGITO)
    # (in Pohua.g)
    def digito!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 45 )

      
      # - - - - main rule block - - - -
      # at line 155:11: ( '0' .. '9' )
      # at line 155:11: ( '0' .. '9' )
      # at line 155:13: '0' .. '9'
      match_range( 0x30, 0x39 )


    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 45 )

    end

    # lexer rule exponente! (EXPONENTE)
    # (in Pohua.g)
    def exponente!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 46 )

      
      # - - - - main rule block - - - -
      # at line 158:13: ( 'e' | 'E' ) ( '+' | '-' )? ( '0' .. '9' )+
      if @input.peek(1) == 0x45 || @input.peek(1) == 0x65
        @input.consume
      else
        mse = MismatchedSet( nil )
        recover mse
        raise mse
      end


      # at line 158:23: ( '+' | '-' )?
      alt_11 = 2
      look_11_0 = @input.peek( 1 )

      if ( look_11_0 == 0x2b || look_11_0 == 0x2d )
        alt_11 = 1
      end
      case alt_11
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
      # at file 158:34: ( '0' .. '9' )+
      match_count_12 = 0
      while true
        alt_12 = 2
        look_12_0 = @input.peek( 1 )

        if ( look_12_0.between?( 0x30, 0x39 ) )
          alt_12 = 1

        end
        case alt_12
        when 1
          # at line 158:35: '0' .. '9'
          match_range( 0x30, 0x39 )

        else
          match_count_12 > 0 and break
          eee = EarlyExit(12)


          raise eee
        end
        match_count_12 += 1
      end


    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 46 )

    end

    # lexer rule hex_digit! (HEX_DIGIT)
    # (in Pohua.g)
    def hex_digit!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 47 )

      
      # - - - - main rule block - - - -
      # at line 162:13: ( '0' .. '9' | 'a' .. 'f' | 'A' .. 'F' )
      if @input.peek( 1 ).between?( 0x30, 0x39 ) || @input.peek( 1 ).between?( 0x41, 0x46 ) || @input.peek( 1 ).between?( 0x61, 0x66 )
        @input.consume
      else
        mse = MismatchedSet( nil )
        recover mse
        raise mse
      end



    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 47 )

    end

    # lexer rule esc_seq! (ESC_SEQ)
    # (in Pohua.g)
    def esc_seq!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 48 )

      
      # - - - - main rule block - - - -
      # at line 166:5: ( '\\\\' ( 'b' | 't' | 'n' | 'f' | 'r' | '\\\"' | '\\'' | '\\\\' ) | UNICODE_ESC | OCTAL_ESC )
      alt_13 = 3
      look_13_0 = @input.peek( 1 )

      if ( look_13_0 == 0x5c )
        case look_13 = @input.peek( 2 )
        when 0x22, 0x27, 0x5c, 0x62, 0x66, 0x6e, 0x72, 0x74 then alt_13 = 1
        when 0x75 then alt_13 = 2
        when 0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37 then alt_13 = 3
        else
          raise NoViableAlternative( "", 13, 1 )
        end
      else
        raise NoViableAlternative( "", 13, 0 )
      end
      case alt_13
      when 1
        # at line 166:9: '\\\\' ( 'b' | 't' | 'n' | 'f' | 'r' | '\\\"' | '\\'' | '\\\\' )
        match( 0x5c )
        if @input.peek(1) == 0x22 || @input.peek(1) == 0x27 || @input.peek(1) == 0x5c || @input.peek(1) == 0x62 || @input.peek(1) == 0x66 || @input.peek(1) == 0x6e || @input.peek(1) == 0x72 || @input.peek(1) == 0x74
          @input.consume
        else
          mse = MismatchedSet( nil )
          recover mse
          raise mse
        end



      when 2
        # at line 167:9: UNICODE_ESC
        unicode_esc!

      when 3
        # at line 168:9: OCTAL_ESC
        octal_esc!

      end
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 48 )

    end

    # lexer rule octal_esc! (OCTAL_ESC)
    # (in Pohua.g)
    def octal_esc!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 49 )

      
      # - - - - main rule block - - - -
      # at line 173:5: ( '\\\\' ( '0' .. '3' ) ( '0' .. '7' ) ( '0' .. '7' ) | '\\\\' ( '0' .. '7' ) ( '0' .. '7' ) | '\\\\' ( '0' .. '7' ) )
      alt_14 = 3
      look_14_0 = @input.peek( 1 )

      if ( look_14_0 == 0x5c )
        look_14_1 = @input.peek( 2 )

        if ( look_14_1.between?( 0x30, 0x33 ) )
          look_14_2 = @input.peek( 3 )

          if ( look_14_2.between?( 0x30, 0x37 ) )
            look_14_4 = @input.peek( 4 )

            if ( look_14_4.between?( 0x30, 0x37 ) )
              alt_14 = 1
            else
              alt_14 = 2
            end
          else
            alt_14 = 3
          end
        elsif ( look_14_1.between?( 0x34, 0x37 ) )
          look_14_3 = @input.peek( 3 )

          if ( look_14_3.between?( 0x30, 0x37 ) )
            alt_14 = 2
          else
            alt_14 = 3
          end
        else
          raise NoViableAlternative( "", 14, 1 )
        end
      else
        raise NoViableAlternative( "", 14, 0 )
      end
      case alt_14
      when 1
        # at line 173:9: '\\\\' ( '0' .. '3' ) ( '0' .. '7' ) ( '0' .. '7' )
        match( 0x5c )
        # at line 173:14: ( '0' .. '3' )
        # at line 173:15: '0' .. '3'
        match_range( 0x30, 0x33 )

        # at line 173:25: ( '0' .. '7' )
        # at line 173:26: '0' .. '7'
        match_range( 0x30, 0x37 )

        # at line 173:36: ( '0' .. '7' )
        # at line 173:37: '0' .. '7'
        match_range( 0x30, 0x37 )


      when 2
        # at line 174:9: '\\\\' ( '0' .. '7' ) ( '0' .. '7' )
        match( 0x5c )
        # at line 174:14: ( '0' .. '7' )
        # at line 174:15: '0' .. '7'
        match_range( 0x30, 0x37 )

        # at line 174:25: ( '0' .. '7' )
        # at line 174:26: '0' .. '7'
        match_range( 0x30, 0x37 )


      when 3
        # at line 175:9: '\\\\' ( '0' .. '7' )
        match( 0x5c )
        # at line 175:14: ( '0' .. '7' )
        # at line 175:15: '0' .. '7'
        match_range( 0x30, 0x37 )


      end
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 49 )

    end

    # lexer rule unicode_esc! (UNICODE_ESC)
    # (in Pohua.g)
    def unicode_esc!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 50 )

      
      # - - - - main rule block - - - -
      # at line 180:9: '\\\\' 'u' HEX_DIGIT HEX_DIGIT HEX_DIGIT HEX_DIGIT
      match( 0x5c )
      match( 0x75 )
      hex_digit!
      hex_digit!
      hex_digit!
      hex_digit!

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 50 )

    end

    # main rule used to study the input at the current position,
    # and choose the proper lexer rule to call in order to
    # fetch the next token
    # 
    # usually, you don't make direct calls to this method,
    # but instead use the next_token method, which will
    # build and emit the actual next token
    def token!
      # at line 1:8: ( T__25 | T__26 | T__27 | T__28 | T__29 | T__30 | T__31 | T__32 | T__33 | T__34 | T__35 | T__36 | T__37 | T__38 | T__39 | T__40 | T__41 | T__42 | T__43 | T__44 | T__45 | T__46 | T__47 | T__48 | T__49 | T__50 | T__51 | T__52 | T__53 | ID | CTE_ENTERA | CTE_FLOTANTE | CTE_STRING | CTE_CHAR | CTE_BOLEANA | CLASE_OB | COMENTARIOS | WHITESPACE | OPERADOR_FACTOR | OPERADOR_TERMINO | OPERADOR_LOGICO | OPERADOR_COMPARACION )
      alt_15 = 42
      alt_15 = @dfa15.predict( @input )
      case alt_15
      when 1
        # at line 1:10: T__25
        t__25!

      when 2
        # at line 1:16: T__26
        t__26!

      when 3
        # at line 1:22: T__27
        t__27!

      when 4
        # at line 1:28: T__28
        t__28!

      when 5
        # at line 1:34: T__29
        t__29!

      when 6
        # at line 1:40: T__30
        t__30!

      when 7
        # at line 1:46: T__31
        t__31!

      when 8
        # at line 1:52: T__32
        t__32!

      when 9
        # at line 1:58: T__33
        t__33!

      when 10
        # at line 1:64: T__34
        t__34!

      when 11
        # at line 1:70: T__35
        t__35!

      when 12
        # at line 1:76: T__36
        t__36!

      when 13
        # at line 1:82: T__37
        t__37!

      when 14
        # at line 1:88: T__38
        t__38!

      when 15
        # at line 1:94: T__39
        t__39!

      when 16
        # at line 1:100: T__40
        t__40!

      when 17
        # at line 1:106: T__41
        t__41!

      when 18
        # at line 1:112: T__42
        t__42!

      when 19
        # at line 1:118: T__43
        t__43!

      when 20
        # at line 1:124: T__44
        t__44!

      when 21
        # at line 1:130: T__45
        t__45!

      when 22
        # at line 1:136: T__46
        t__46!

      when 23
        # at line 1:142: T__47
        t__47!

      when 24
        # at line 1:148: T__48
        t__48!

      when 25
        # at line 1:154: T__49
        t__49!

      when 26
        # at line 1:160: T__50
        t__50!

      when 27
        # at line 1:166: T__51
        t__51!

      when 28
        # at line 1:172: T__52
        t__52!

      when 29
        # at line 1:178: T__53
        t__53!

      when 30
        # at line 1:184: ID
        id!

      when 31
        # at line 1:187: CTE_ENTERA
        cte_entera!

      when 32
        # at line 1:198: CTE_FLOTANTE
        cte_flotante!

      when 33
        # at line 1:211: CTE_STRING
        cte_string!

      when 34
        # at line 1:222: CTE_CHAR
        cte_char!

      when 35
        # at line 1:231: CTE_BOLEANA
        cte_boleana!

      when 36
        # at line 1:243: CLASE_OB
        clase_ob!

      when 37
        # at line 1:252: COMENTARIOS
        comentarios!

      when 38
        # at line 1:264: WHITESPACE
        whitespace!

      when 39
        # at line 1:275: OPERADOR_FACTOR
        operador_factor!

      when 40
        # at line 1:291: OPERADOR_TERMINO
        operador_termino!

      when 41
        # at line 1:308: OPERADOR_LOGICO
        operador_logico!

      when 42
        # at line 1:324: OPERADOR_COMPARACION
        operador_comparacion!

      end
    end

    
    # - - - - - - - - - - DFA definitions - - - - - - - - - - -
    class DFA15 < ANTLR3::DFA
      EOT = unpack( 1, -1, 2, 22, 1, -1, 1, 22, 1, 28, 3, 22, 1, -1, 3, 
                    22, 4, -1, 1, 53, 1, 22, 1, -1, 2, 22, 1, -1, 1, 58, 
                    2, -1, 2, 28, 8, -1, 7, 22, 1, 28, 9, 22, 1, -1, 1, 
                    22, 1, -1, 2, 22, 2, -1, 2, 84, 1, -1, 3, 22, 1, 88, 
                    1, 22, 1, 90, 1, 22, 1, 28, 7, 22, 1, -1, 1, 22, 1, 
                    101, 1, 22, 1, 103, 1, 22, 1, -1, 1, 22, 1, 106, 1, 
                    22, 1, -1, 1, 108, 1, -1, 1, 109, 1, 28, 4, 22, 1, 115, 
                    2, 22, 1, 118, 1, -1, 1, 22, 1, -1, 1, 22, 1, 121, 1, 
                    -1, 1, 22, 2, -1, 1, 28, 2, 22, 1, 126, 1, 22, 1, -1, 
                    2, 22, 1, -1, 1, 22, 1, 131, 1, -1, 1, 22, 1, 28, 1, 
                    134, 1, 22, 1, -1, 2, 22, 1, 138, 1, 22, 1, -1, 1, 22, 
                    1, 28, 1, -1, 2, 22, 1, 144, 1, -1, 1, 145, 1, 146, 
                    1, 28, 1, 148, 1, 22, 3, -1, 1, 150, 1, -1, 1, 151, 
                    2, -1 )
      EOF = unpack( 152, -1 )
      MIN = unpack( 1, 9, 1, 104, 1, 110, 1, -1, 1, 105, 1, 114, 1, 101, 
                    2, 97, 1, -1, 1, 101, 1, 105, 1, 111, 4, -1, 1, 61, 
                    1, 109, 1, -1, 1, 101, 1, 117, 1, -1, 1, 46, 2, -1, 
                    1, 73, 1, 79, 6, -1, 1, 61, 1, -1, 2, 97, 3, 116, 1, 
                    110, 1, 111, 1, 105, 1, 116, 1, 101, 1, 99, 1, 105, 
                    1, 114, 1, 103, 1, 114, 1, 63, 1, 108, 1, -1, 1, 112, 
                    1, -1, 2, 101, 2, -1, 2, 48, 1, -1, 1, 115, 1, 114, 
                    1, 105, 1, 48, 1, 101, 1, 48, 1, 116, 1, 110, 1, 111, 
                    1, 110, 1, 117, 1, 110, 1, 97, 1, 114, 1, 105, 1, -1, 
                    1, 111, 1, 48, 1, 114, 1, 48, 1, 118, 1, -1, 1, 101, 
                    1, 48, 1, 101, 1, -1, 1, 48, 1, -1, 1, 48, 1, 99, 1, 
                    100, 1, 116, 1, 111, 1, 99, 1, 48, 1, 101, 1, 110, 1, 
                    48, 1, -1, 1, 105, 1, -1, 1, 111, 1, 48, 1, -1, 1, 110, 
                    2, -1, 1, 105, 1, 111, 1, 114, 1, 48, 1, 105, 1, -1, 
                    1, 115, 1, 103, 1, -1, 1, 109, 1, 48, 1, -1, 1, 100, 
                    1, 112, 1, 48, 1, 97, 1, -1, 1, 112, 1, 97, 1, 48, 1, 
                    101, 1, -1, 1, 101, 1, 97, 1, -1, 1, 115, 1, 97, 1, 
                    48, 1, -1, 2, 48, 1, 108, 1, 48, 1, 108, 3, -1, 1, 48, 
                    1, -1, 1, 48, 2, -1 )
      MAX = unpack( 1, 122, 1, 108, 1, 120, 1, -1, 1, 108, 1, 114, 1, 105, 
                    1, 97, 1, 114, 1, -1, 1, 101, 1, 116, 1, 111, 4, -1, 
                    1, 61, 1, 109, 1, -1, 1, 101, 1, 117, 1, -1, 1, 57, 
                    2, -1, 1, 73, 1, 79, 6, -1, 1, 61, 1, -1, 2, 97, 3, 
                    116, 1, 110, 1, 111, 1, 105, 1, 116, 1, 101, 1, 99, 
                    1, 105, 1, 114, 1, 103, 1, 114, 1, 110, 1, 108, 1, -1, 
                    1, 112, 1, -1, 2, 101, 2, -1, 2, 122, 1, -1, 1, 115, 
                    1, 114, 1, 105, 1, 122, 1, 101, 1, 122, 1, 116, 1, 110, 
                    1, 111, 1, 110, 1, 117, 1, 110, 1, 97, 1, 114, 1, 105, 
                    1, -1, 1, 111, 1, 122, 1, 114, 1, 122, 1, 118, 1, -1, 
                    1, 101, 1, 122, 1, 101, 1, -1, 1, 122, 1, -1, 1, 122, 
                    1, 99, 1, 100, 1, 116, 1, 111, 1, 99, 1, 122, 1, 101, 
                    1, 110, 1, 122, 1, -1, 1, 105, 1, -1, 1, 111, 1, 122, 
                    1, -1, 1, 110, 2, -1, 1, 105, 1, 111, 1, 114, 1, 122, 
                    1, 105, 1, -1, 1, 115, 1, 103, 1, -1, 1, 109, 1, 122, 
                    1, -1, 1, 100, 1, 112, 1, 122, 1, 97, 1, -1, 1, 112, 
                    1, 97, 1, 122, 1, 101, 1, -1, 1, 101, 1, 97, 1, -1, 
                    1, 115, 1, 97, 1, 122, 1, -1, 2, 122, 1, 108, 1, 122, 
                    1, 108, 3, -1, 1, 122, 1, -1, 1, 122, 2, -1 )
      ACCEPT = unpack( 3, -1, 1, 3, 5, -1, 1, 9, 3, -1, 1, 16, 1, 17, 1, 
                       18, 1, 19, 2, -1, 1, 24, 2, -1, 1, 30, 1, -1, 1, 
                       33, 1, 34, 2, -1, 1, 36, 1, 37, 1, 38, 1, 39, 1, 
                       40, 1, 41, 1, -1, 1, 42, 17, -1, 1, 20, 1, -1, 1, 
                       24, 2, -1, 1, 31, 1, 32, 2, -1, 1, 41, 15, -1, 1, 
                       21, 5, -1, 1, 35, 3, -1, 1, 11, 1, -1, 1, 4, 10, 
                       -1, 1, 14, 1, -1, 1, 25, 2, -1, 1, 15, 1, -1, 1, 
                       28, 1, 12, 5, -1, 1, 27, 2, -1, 1, 22, 2, -1, 1, 
                       1, 4, -1, 1, 7, 4, -1, 1, 29, 2, -1, 1, 6, 3, -1, 
                       1, 13, 5, -1, 1, 10, 1, 23, 1, 2, 1, -1, 1, 26, 1, 
                       -1, 1, 5, 1, 8 )
      SPECIAL = unpack( 152, -1 )
      TRANSITION = [
        unpack( 2, 30, 2, -1, 1, 30, 18, -1, 1, 30, 1, 34, 1, 24, 1, 29, 
                2, -1, 1, 33, 1, 25, 1, 13, 1, 15, 1, 31, 1, 19, 1, 14, 
                1, 32, 1, 16, 1, 31, 10, 23, 1, 3, 1, 9, 1, 35, 1, 17, 1, 
                35, 2, -1, 13, 28, 1, 27, 1, 28, 1, 5, 2, 28, 1, 26, 7, 
                28, 6, -1, 1, 22, 1, 12, 1, 1, 1, 22, 1, 2, 1, 4, 2, 22, 
                1, 18, 2, 22, 1, 20, 1, 6, 1, 21, 1, 22, 1, 8, 1, 22, 1, 
                10, 1, 11, 2, 22, 1, 7, 4, 22 ),
        unpack( 1, 37, 3, -1, 1, 36 ),
        unpack( 1, 39, 4, -1, 1, 40, 4, -1, 1, 38 ),
        unpack(  ),
        unpack( 1, 41, 2, -1, 1, 42 ),
        unpack( 1, 43 ),
        unpack( 1, 44, 3, -1, 1, 45 ),
        unpack( 1, 46 ),
        unpack( 1, 48, 16, -1, 1, 47 ),
        unpack(  ),
        unpack( 1, 49 ),
        unpack( 1, 51, 10, -1, 1, 50 ),
        unpack( 1, 52 ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 35 ),
        unpack( 1, 54 ),
        unpack(  ),
        unpack( 1, 56 ),
        unpack( 1, 57 ),
        unpack(  ),
        unpack( 1, 59, 1, -1, 10, 23 ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 60 ),
        unpack( 1, 61 ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 62 ),
        unpack(  ),
        unpack( 1, 63 ),
        unpack( 1, 64 ),
        unpack( 1, 65 ),
        unpack( 1, 66 ),
        unpack( 1, 67 ),
        unpack( 1, 68 ),
        unpack( 1, 69 ),
        unpack( 1, 70 ),
        unpack( 1, 71 ),
        unpack( 1, 72 ),
        unpack( 1, 73 ),
        unpack( 1, 74 ),
        unpack( 1, 75 ),
        unpack( 1, 76 ),
        unpack( 1, 77 ),
        unpack( 1, 78, 46, -1, 1, 79 ),
        unpack( 1, 80 ),
        unpack(  ),
        unpack( 1, 81 ),
        unpack(  ),
        unpack( 1, 82 ),
        unpack( 1, 83 ),
        unpack(  ),
        unpack(  ),
        unpack( 10, 28, 7, -1, 26, 28, 6, -1, 26, 28 ),
        unpack( 10, 28, 7, -1, 26, 28, 6, -1, 26, 28 ),
        unpack(  ),
        unpack( 1, 85 ),
        unpack( 1, 86 ),
        unpack( 1, 87 ),
        unpack( 10, 22, 7, -1, 26, 22, 4, -1, 1, 22, 1, -1, 26, 22 ),
        unpack( 1, 89 ),
        unpack( 10, 22, 7, -1, 26, 22, 4, -1, 1, 22, 1, -1, 26, 22 ),
        unpack( 1, 91 ),
        unpack( 1, 92 ),
        unpack( 1, 93 ),
        unpack( 1, 94 ),
        unpack( 1, 95 ),
        unpack( 1, 96 ),
        unpack( 1, 97 ),
        unpack( 1, 98 ),
        unpack( 1, 99 ),
        unpack(  ),
        unpack( 1, 100 ),
        unpack( 10, 22, 7, -1, 26, 22, 4, -1, 1, 22, 1, -1, 26, 22 ),
        unpack( 1, 102 ),
        unpack( 10, 22, 7, -1, 26, 22, 4, -1, 1, 22, 1, -1, 26, 22 ),
        unpack( 1, 104 ),
        unpack(  ),
        unpack( 1, 105 ),
        unpack( 10, 22, 7, -1, 26, 22, 4, -1, 1, 22, 1, -1, 26, 22 ),
        unpack( 1, 107 ),
        unpack(  ),
        unpack( 10, 22, 7, -1, 26, 22, 4, -1, 1, 22, 1, -1, 26, 22 ),
        unpack(  ),
        unpack( 10, 22, 7, -1, 26, 22, 4, -1, 1, 22, 1, -1, 26, 22 ),
        unpack( 1, 110 ),
        unpack( 1, 111 ),
        unpack( 1, 112 ),
        unpack( 1, 113 ),
        unpack( 1, 114 ),
        unpack( 10, 22, 7, -1, 26, 22, 4, -1, 1, 22, 1, -1, 26, 22 ),
        unpack( 1, 116 ),
        unpack( 1, 117 ),
        unpack( 10, 22, 7, -1, 26, 22, 4, -1, 1, 22, 1, -1, 26, 22 ),
        unpack(  ),
        unpack( 1, 119 ),
        unpack(  ),
        unpack( 1, 120 ),
        unpack( 10, 22, 7, -1, 26, 22, 4, -1, 1, 22, 1, -1, 26, 22 ),
        unpack(  ),
        unpack( 1, 122 ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 123 ),
        unpack( 1, 124 ),
        unpack( 1, 125 ),
        unpack( 10, 22, 7, -1, 26, 22, 4, -1, 1, 22, 1, -1, 26, 22 ),
        unpack( 1, 127 ),
        unpack(  ),
        unpack( 1, 128 ),
        unpack( 1, 129 ),
        unpack(  ),
        unpack( 1, 130 ),
        unpack( 10, 22, 7, -1, 26, 22, 4, -1, 1, 22, 1, -1, 26, 22 ),
        unpack(  ),
        unpack( 1, 132 ),
        unpack( 1, 133 ),
        unpack( 10, 22, 7, -1, 26, 22, 4, -1, 1, 22, 1, -1, 26, 22 ),
        unpack( 1, 135 ),
        unpack(  ),
        unpack( 1, 136 ),
        unpack( 1, 137 ),
        unpack( 10, 22, 7, -1, 26, 22, 4, -1, 1, 22, 1, -1, 26, 22 ),
        unpack( 1, 139 ),
        unpack(  ),
        unpack( 1, 140 ),
        unpack( 1, 141 ),
        unpack(  ),
        unpack( 1, 142 ),
        unpack( 1, 143 ),
        unpack( 10, 22, 7, -1, 26, 22, 4, -1, 1, 22, 1, -1, 26, 22 ),
        unpack(  ),
        unpack( 10, 22, 7, -1, 26, 22, 4, -1, 1, 22, 1, -1, 26, 22 ),
        unpack( 10, 22, 7, -1, 26, 22, 4, -1, 1, 22, 1, -1, 26, 22 ),
        unpack( 1, 147 ),
        unpack( 10, 22, 7, -1, 26, 22, 4, -1, 1, 22, 1, -1, 26, 22 ),
        unpack( 1, 149 ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack( 10, 28, 7, -1, 26, 28, 6, -1, 26, 28 ),
        unpack(  ),
        unpack( 10, 22, 7, -1, 26, 22, 4, -1, 1, 22, 1, -1, 26, 22 ),
        unpack(  ),
        unpack(  )
      ].freeze
      
      ( 0 ... MIN.length ).zip( MIN, MAX ) do | i, a, z |
        if a > 0 and z < 0
          MAX[ i ] %= 0x10000
        end
      end
      
      @decision = 15
      

      def description
        <<-'__dfa_description__'.strip!
          1:1: Tokens : ( T__25 | T__26 | T__27 | T__28 | T__29 | T__30 | T__31 | T__32 | T__33 | T__34 | T__35 | T__36 | T__37 | T__38 | T__39 | T__40 | T__41 | T__42 | T__43 | T__44 | T__45 | T__46 | T__47 | T__48 | T__49 | T__50 | T__51 | T__52 | T__53 | ID | CTE_ENTERA | CTE_FLOTANTE | CTE_STRING | CTE_CHAR | CTE_BOLEANA | CLASE_OB | COMENTARIOS | WHITESPACE | OPERADOR_FACTOR | OPERADOR_TERMINO | OPERADOR_LOGICO | OPERADOR_COMPARACION );
        __dfa_description__
      end
    end

    
    private
    
    def initialize_dfas
      super rescue nil
      @dfa15 = DFA15.new( self, 15 )

    end
  end # class Lexer < ANTLR3::Lexer

  at_exit { Lexer.main( ARGV ) } if __FILE__ == $0
end

