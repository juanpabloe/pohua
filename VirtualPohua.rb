class Frame
  attr_accessor :registro, :cuadruplo_al_salir

  def initialize(cuadruplo_al_salir, cantidad_registros = 300)
    @registro = Array.new(cantidad_registros)
    @cuadruplo_al_salir = cuadruplo_al_salir
  end
end

class String

  def entero?
    not self.match(/^[0-9]+$/).nil?
  end

  def flotante?
    not self.match(/^[0-9]+[\.][0-9]+((e|E)(\+|\-)?[0-9]+)?$/).nil?
  end

end

class VirtualPohua

  def initialize
    @inst_pointer = 0               # Apuntador al cuadruplo actual
    @cuadruplos = Array.new   # Lista de cuadruplos
    @p_frames = Array.new     # Pila principal de frames de ejecucion
  end

  def ejecuta
    posicion_cuadruplo_halt = @cuadruplos.size-1
    frame_principal = Frame.new(posicion_cuadruplo_halt)    # Creamos el primer frame de la pila
    @p_frames << frame_principal                            # Metemos el primer frame a la pila
    cuad_act = @cuadruplos.first                            # Definimos el cuadruplo actual
    reg_act = @p_frames.last.registro                       # Definimos el arreglo de registros actual

    until cuad_act.first == 'halt'

      @inst_pointer = @inst_pointer + 1   # Avanzamos uno en la lista de cuadruplos
      cod_op = cuad_act.first
      case cod_op

      # Expresiones aritmeticas
      when '+'
        reg_act[cuad_act[3]] = reg_act[cuad_act[1]] + reg_act[cuad_act[2]]
      when '-'
        reg_act[cuad_act[3]] = reg_act[cuad_act[1]] - reg_act[cuad_act[2]]
      when '*'
        reg_act[cuad_act[3]] = reg_act[cuad_act[1]] * reg_act[cuad_act[2]]
      when '/'
        reg_act[cuad_act[3]] = reg_act[cuad_act[1]] / reg_act[cuad_act[2]]

      # Expresiones logicas y de comparacion
      when '>'
        reg_act[cuad_act[3]] = reg_act[cuad_act[1]] > reg_act[cuad_act[2]]
      when '<'
        reg_act[cuad_act[3]] = reg_act[cuad_act[1]] < reg_act[cuad_act[2]]
      when '=='
        reg_act[cuad_act[3]] = reg_act[cuad_act[1]] == reg_act[cuad_act[2]]
      when '!='
        reg_act[cuad_act[3]] = reg_act[cuad_act[1]] != reg_act[cuad_act[2]]
      when '&&'
        reg_act[cuad_act[3]] = reg_act[cuad_act[1]] && reg_act[cuad_act[2]]
      when '||'
        reg_act[cuad_act[3]] = reg_act[cuad_act[1]] || reg_act[cuad_act[2]]

      # Asignacion
      when '='
        reg_act[cuad_act[3]] = reg_act[cuad_act[1]]

      when 'iconst'
        reg_act[cuad_act[3]] = cuad_act[1]
      when 'fconst'
        reg_act[cuad_act[3]] = cuad_act[1]
      when 'sconst'
        reg_act[cuad_act[3]] = cuad_act[1]
      when 'cconst'
        reg_act[cuad_act[3]] = cuad_act[1]
      when 'bconst'
        if cuad_act[1] == 'SI'
          reg_act[cuad_act[3]] = true
        elsif cuad_act[1] == 'NO'
          reg_act[cuad_act[3]] = false
        end

      # Saltos
      when 'gotof'
        @inst_pointer = cuad_act[3] if reg_act[cuad_act[1]] == false
      when 'goto'
        @inst_pointer = cuad_act[3]

      # Impresiones y lecturas a consola
      when 'imp'
        var = reg_act[cuad_act[3]]
        # Para reemplazar true y false por SI y NO
        var = var.to_s.gsub(/true/, 'SI')
        var = var.to_s.gsub(/false/, 'NO')
        # Para eliminar comillas finales e iniciales de strings
        var = var.to_s.gsub(/\"/, '')
        puts var
      when 'elee'
        var = STDIN.gets.chomp
        raise "Se esperaba un entero" unless var.entero?
        reg_act[cuad_act[3]] = var.to_i
      when 'flee'
        var = STDIN.gets.chomp
        raise "Se esperaba un flotante" unless var.flotante?
        reg_act[cuad_act[3]] = var.to_f
      when 'slee'
        var = STDIN.gets.chomp
        reg_act[cuad_act[3]] = var.to_s
      end

      cuad_act = @cuadruplos[@inst_pointer]
    end

    @p_frames.each do |frame|
      frame.registro.each_with_index do |r, i|
        puts "Registro #{i}: #{r}" unless r.nil?
      end
    end
  end

  def carga_cuadruplos
    @cuadruplos = []
    # Abrimos el archivo con los cuadruplos
    File.open("codobj", "r") do |lineas_de_cuadruplos|
      lineas_de_cuadruplos.each do |linea|
        cuadruplo = linea.split(",")
        cuadruplo[3] = cuadruplo.last.gsub(/\n/, '')
        # Parseamos los enteros y flotantes del archivo
        cuadruplo.each_with_index do |c, i|
          if c.entero?
            cuadruplo[i] = c.to_i
          elsif c.flotante?
            cuadruplo[i] = c.to_f
          end
        end
        # Guardamos cada cuadruplo en el arreglo global de cuadruplos
        @cuadruplos << cuadruplo
      end
    end
  end

end

pohua = VirtualPohua.new
pohua.carga_cuadruplos
pohua.ejecuta
