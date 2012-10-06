class TablaSemantica

  attr_accessor :t

  def initialize
    @t = {
      # Con el operador +
      '+' => {
        'ent' => {
          'ent' => 'ent',
          'flot' => 'flot'
        },
        'flot' => {
          'flot' => 'flot',
          'ent' => 'flot'
        },
        'string' => {
          'string' => 'string',
          'char' => 'string'
        },
        'char' => {
          'char' => 'string',
          'string' => 'string'
        }
      },
      # Con el operador de resta -
      '-' => {
        'ent' => {
          'ent' => 'ent',
          'flot' => 'flot'
        },
        'flot' => {
          'ent' => 'flot',
          'flot' => 'flot'
        }
      },
      # Con el operador de division /
      '/' => {
        'ent' => {
          'ent' => 'ent',
          'flot' => 'flot'
        },
        'flot' => {
          'ent' => 'flot',
          'flot' => 'flot'
        }
      },
      # Con el operador de multiplicacion *
      '*' => {
        'ent' => {
          'ent' => 'ent',
          'flot' => 'flot'
        },
        'flot' => {
          'ent' => 'flot',
          'flot' => 'flot'
        }
      },
      # Con el operador mayorque >
      '>' => { 
        'ent' => {
          'ent' => 'bol',
          'flot' => 'bol'
        },
        'flot' => {
          'flot' => 'bol',
          'ent' => 'bol'
        }
      },
      # Con el operador menor que <
      '<' => { 
        'ent' => {
          'ent' => 'bol',
          'flot' => 'bol'
        },
        'flot' => {
          'flot' => 'bol',
          'ent' => 'bol'
        }
      },
      # Con el operador AND &&
      '&&' => {
        'bol' => {
          'bol' => 'bol'
        }
      },
      # Con el operador OR ||
      '||' => {
        'bol' => {
          'bol' => 'bol'
        }
      },
      # Con el operador de asignacion =
      '=' => {
        'ent' => {
          'ent' => 'ent'
        },
        'flot' => {
          'flot' => 'flot'
        },
        'string' => {
          'string' => 'string',
          'char' => 'string'
        },
        'char' => {
          'char' => 'char'
        },
        'bol' => {
          'bol' => 'bol'
        },
      },
      # Con el operador de diferentecia !=
      '!=' => {
        'ent' => {
          'ent' => 'bol',
          'flot' => 'bol'
        },
        'flot' => {
          'flot' => 'bol',
          'ent' => 'bol'
        },
        'string' => {
          'string' => 'bol'
        },
        'char' => {
          'char' => 'bol'
        },
        'bol' => {
          'bol' => 'bol'
        }
      }
    }
  end

end
