class ClosingParenthesis
  attr_reader :file_path
  attr_accessor :all_braces, :errors, :erreurs, :les_erreurs, :les_lignes, :opened, :closed, :parentheses, :curly_braces, :square_brackets
  def initialize(file_path)
    @errors = []
    @erreurs = {}
    @file_path = file_path
    @les_erreurs = []
    @opened = []
    @closed = []
    @parentheses = []
    @pr = []
    @square_brackets = []
    @curly_braces = []
    @les_lignes = []
  end

  def couples_add(file_path)
    @par_open = 0
    @par_closed = 0
    @curly_open = 0
    @curly_closed = 0
    @square_open = 0
    @square_closed = 0
    File.open(file_path).each_with_index do |element, line|
      element.length.times do |i|
        @linea = line + 1
        case element[i]
        when '('
          @open_p = @parentheses.unshift([element[i], @linea.to_s])
        when ')'
          @closed_p = @parentheses.unshift([element[i], @linea.to_s])
        when '{'
          @open_curly = @curly_braces.unshift([element[i], @linea.to_s])
        when '}'
          @closed_curly = @curly_braces.unshift([element[i], @linea.to_s])
          @curly_c
        when '['
          @open_b = @square_brackets.unshift([element[i], @linea.to_s])
        when ']'
          @closed_p = @square_brackets.unshift([element[i], @linea.to_s])
        end
      end
    end
    parentheses_check
    curly_braces_check
    square_brackets_check
    sorting_errors
    trigger_errors
  end

  def parentheses_check
    for i in 1..@parentheses.length - 1 do
      if @parentheses[i - 1][0] == ')' && @parentheses[i][0] == ')'
        @errors.unshift(@parentheses[i - 1])
      elsif @parentheses[i - 1][0] == '(' && @parentheses[i][0] == '('
        @errors.unshift(@parentheses[i])
      elsif @parentheses[i - 1][0] == '}' && @parentheses[i][0] == '{' && @parentheses[i - 1][1] != @parentheses[i][1]
        @errors.unshift(@parentheses[i - 1])
      elsif @parentheses[i - 1][0] == '{' && @parentheses[i][0] == '}' && @parentheses[i - 1][1] == @parentheses[i][1]
        @errors.unshift(@parentheses[i - 1])
      end
    end
  end

  def curly_braces_check
    for i in 1..@curly_braces.length - 1 do
      if @curly_braces[i - 1][0] == '}' && @curly_braces[i][0] == '}'
        @errors.unshift(@curly_braces[i - 1])
      elsif @curly_braces[i - 1][0] == '{' && @curly_braces[i][0] == '{'
        @errors.unshift(@curly_braces[i])
      elsif @curly_braces[i - 1][0] == '}' && @curly_braces[i][0] == '{' && @curly_braces[i - 1][1] != @curly_braces[i][1]
        @errors.unshift(@curly_braces[i - 1])
      elsif @curly_braces[i - 1][0] == '{' && @curly_braces[i][0] == '}' && @curly_braces[i - 1][1] == @curly_braces[i][1]
        @errors.unshift(@curly_braces[i - 1])
      end
    end
  end

  def square_brackets_check
    for i in 1..@square_brackets.length - 1 do
      if @square_brackets[i - 1][0] == ']' && @square_brackets[i][0] == ']'
        @errors.unshift(@square_brackets[i - 1])
      elsif @square_brackets[i - 1][0] == '[' && @square_brackets[i][0] == '['
        @errors.unshift(@square_brackets[i])
      elsif @square_brackets[i - 1][0] == ']' && @square_brackets[i][0] == '[' && @square_brackets[i - 1][1] != @square_brackets[i][1]
        @errors.unshift(@square_brackets[i - 1])
      elsif @square_brackets[i - 1][0] == '[' && @square_brackets[i][0] == ']' && @square_brackets[i - 1][1] == @square_brackets[i][1]
        @errors.unshift(@square_brackets[i - 1])
      end
    end
  end

  def trigger_errors
    unless @errors.empty?
      @errors.each do |el|
        el.length.times do |i|
          if el[i] == '('
            elm = ')'
            @les_erreurs.push("Error, missing #{elm} on line #{el[i + 1]}")
          elsif el[i] == ')'
            elm = '('
            @les_erreurs.push("Error, missing #{elm} on line #{el[i + 1]}")
          elsif el[i] == '['
            elm = ']'
            @les_erreurs.push("Error, missing #{elm} on line #{el[i + 1]}")
          elsif el[i] == ']'
            elm = '['
            @les_erreurs.push("Error, missing #{elm} on line #{el[i + 1]}")
          elsif el[i] == '{'
            elm = '}'
            @les_erreurs.push("Error, missing #{elm} on line #{el[i + 1]}")
          elsif el[i] == '}'
            elm = '{'
            @les_erreurs.push("Error, missing #{elm} on line #{el[i + 1]}")
          end
        end
      end
    end
    @les_erreurs
  end

  def sorting_errors
    array_length = @errors.size
    return @errors if array_length <= 1

    loop do
      swapped = false
      (array_length - 1).times do |i|
        if @errors[i][1] > @errors[i + 1][1]
          @errors[i], @errors[i + 1] = @errors[i + 1], @errors[i]
          swapped = true
        end
      end
      break unless swapped
    end
    @errors
  end

  def puts_errors
    @les_erreurs
  end

  def display_path
    @file_path
  end
end
