class Frame
  attr_accessor :registros, :cuadruplo_al_salir, :clase_al_salir

  def initialize(cuadruplo_al_salir = 0, cantidad_registros = 500)
    @registros = Registros.new(cantidad_registros)
    @cuadruplo_al_salir = cuadruplo_al_salir
  end
end

class Registros < Array

  def initialize(cantidad_registros)
    super
    # Creamos espacio en la primer posicion del registro para los objeto el objeto del frame del principal
    # To-do: pasar un parametro con la cantidad especifica de atributos del objeto
    self[50] = Objeto.new 100
  end

  # Al asignar un valor a un registro, verificamos si es un atributo para un objeto
  def []=(indice, atributo)

    # Verificamos si es un indice de acceso a arreglo
    indice = self[indice.direccion_de_indice_de_arreglo] if indice.class == String and indice.acceso_arreglo?

    lim_inf = 100    # Limite inferior de las direcciones de Clase
    lim_sup = 149    # Limite superior de las direcciones de Clase
    case indice
    when lim_inf..lim_sup # Si el indice es una direccion de Clase
      self[50][indice - lim_inf] = atributo    # Guardamos el atributo en el Objeto
    else
      super(indice, atributo)     # Si no es una dir de clase, asigna el valor del registro normal
    end
  end

  # Al acceder a un atributo de un registro, verificamos si es un atributo de un objeto
  def [](indice)

    # Verificamos si es un indice de acceso a arreglo
    indice = self[indice.direccion_de_indice_de_arreglo] if indice.class == String and indice.acceso_arreglo?

    lim_inf = 100    # Limite inferior de las direcciones de Clase
    lim_sup = 149    # Limite superior de las direcciones de Clase
    case indice
    when lim_inf..lim_sup # Si el indice es una direccion de Clase
      return self[50][indice - lim_inf]    # Regresamos el atributo del objeto
    else
      return super(indice)    # Si no es una dir de clase, regresamos el valor del registro normal
    end
  end

end

class Objeto < Array
  # Este vector fungira como receptor de atributos de un objeto al momento de estar leyendo
end

class String

  def entero?
    not self.match(/^(-)?[0-9]+$/).nil?
  end

  def flotante?
    not self.match(/^(-)?[0-9]+[\.][0-9]+((e|E)(\+|\-)?[0-9]+)?$/).nil?
  end

  def acceso_arreglo?
    not self.match(/^\([0-9]+\)$/).nil?
  end

  def direccion_de_indice_de_arreglo
     self.gsub(/(\(|\))/, '').to_i
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
    reg_act = @p_frames.last.registros                      # Definimos el arreglo de registros actual

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

      # Metodos
      when 'era'
        @p_frames << Frame.new
      when 'gosub'
        # El registro 1 guarda la direccion de la instancia de clase
        @p_frames.last.registros[50] = reg_act[cuad_act[1]]
        @p_frames.last.clase_al_salir = cuad_act[1]
        # Al salir de ese frame
        @p_frames.last.cuadruplo_al_salir = @inst_pointer
        # El registro actual ahora seran los registros del nuevo metodo invocado
        reg_act = @p_frames.last.registros
        # El programa apuntara a la primera instruccion del metodo invocado
        @inst_pointer = cuad_act[3]

      when 'param'
        # El parametro se guarda en el indice indicado
        @p_frames.last.registros[50 + cuad_act[3]] = reg_act[cuad_act[1]]

      when 'ret'
        direccion_retorno = cuad_act[3]
        registro_anterior = reg_act
        ultima_clase_invocada = @p_frames.last.clase_al_salir

        # Se apunta a donde el programa ira al terminar el metodo
        @inst_pointer = @p_frames.last.cuadruplo_al_salir
        # Se elimina el frame
        @p_frames.pop
        # El apuntador de registro actual se actualiza con el del nuevo
        # frame tope
        reg_act = @p_frames.last.registros

        reg_act[ultima_clase_invocada] = registro_anterior[50]
        if direccion_retorno.nil?
          direccion_retorno = nil
          registro_anterior = nil
        end
      when 'get'
        # Guarda el valor de la variable de retorno de un metodo
        reg_act[cuad_act[3]] = registro_anterior[direccion_retorno]
        direccion_retorno = nil
        registro_anterior = nil

      when 'nuevo'
        # En el registro actual creamos un nuevo objeto
        reg_act[cuad_act[3]] = Objeto.new 100

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

      # Arreglos
      when 'ver'
        unless reg_act[cuad_act[1]] < cuad_act[3] and reg_act[cuad_act[1]] >= 0
          raise "Indice de arreglo fuera de rango"
        end
      when 'desp'
        reg_act[cuad_act[3]] = cuad_act[1] + reg_act[cuad_act[2]]
      end

      cuad_act = @cuadruplos[@inst_pointer]
    end

  end

  def carga_cuadruplos
    @cuadruplos = []
    # Abrimos el archivo con los cuadruplos
    File.open(ARGV[0], "r") do |lineas_de_cuadruplos|
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
