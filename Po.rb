# Cargamos el path de archivos actual
$:.unshift File.dirname(__FILE__)

require 'PohuaLexer'
require 'PohuaParser'

# Pregunta por parametros correctos al compilar
if(ARGV.size < 1 or ARGV[0][-3..-1] != '.ph')
  puts "Error. Para compilar utiliza: Po test.ph"
  exit
end

input = ANTLR3::FileStream.new(File.open(ARGV[0]))
pohua_lexer = Pohua::Lexer.new(input)
token_stream = ANTLR3::CommonTokenStream.new(pohua_lexer)
pohua_parser = Pohua::Parser.new(token_stream)

pohua_parser.programa # Llama a la primer regla de compilacion

# Genera el archivo de codigo objeto
File.rename('codobj', ARGV[0].gsub(/.ph/, ''))
