class ClosingParenthesis
  attr_reader :file_path
  attr_accessor :all_braces, :errors, :les_erreurs, :parentheses, :curly_braces, :square_brackets
  def initialize(file_path)
    @errors = []
    @file_path = file_path
    @les_erreurs = []
    @parentheses = []
    @square_brackets = []
    @curly_braces = []
  end

  def couples_add(file_path)
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
    displayer_errors
  end

  def parentheses_check
    length = @parentheses.length - 1
    length_after = length
    i = 1
    while i < length
      if @parentheses[i - 1][0] == ')' && @parentheses[i][0] == '(' && @parentheses[i][1] == @parentheses[i - 1][1]
        delete = @parentheses.delete_at(i)
        delete_previous = @parentheses.delete_at(i - 1)
        break if @parentheses[i].nil?

        i = 1
      end
      i = i + 1
    end
    if @parentheses.length == 2
      if @parentheses[0][0] == @parentheses[1][0]
        @errors = @errors + @parentheses
      else
        @errors = @errors
      end
    else
      @errors = @errors + @parentheses
    end
  end

  def curly_braces_check
    length = @curly_braces.length - 1
    length_after = length
    i = 1
    while i < length
      if @curly_braces[i - 1][0] == '}' && @curly_braces[i][0] == '{' && @curly_braces[i][1] == @curly_braces[i - 1][1]
        delete = @curly_braces.delete_at(i)
        delete_previous = @curly_braces.delete_at(i - 1)
        break if @curly_braces[i].nil?

        i = 1
      end
      i = i + 1
    end
    if @curly_braces.length == 2
      if @curly_braces[0][0] == @curly_braces[1][0]
        @errors = @errors + @curly_braces
      else
        @errors = @errors
      end
    else
      @errors = @errors + @curly_braces
    end
  end

  def square_brackets_check
    length = @square_brackets.length - 1
    length_after = length
    i = 1
    while i < length
      if @square_brackets[i - 1][0] == ']' && @square_brackets[i][0] == '[' && @square_brackets[i][1] == @square_brackets[i - 1][1]
        delete = @square_brackets.delete_at(i)
        delete_previous = @square_brackets.delete_at(i - 1)
        break if @square_brackets[i].nil?

        i = 1
      end
      i = i + 1
    end
    if @square_brackets.length == 2
      if @square_brackets[0][0] == @square_brackets[1][0]
        @errors = @errors + @square_brackets
      else
        @errors = @errors
      end
    else
      @errors = @errors + @square_brackets
    end
  end

  def displayer_errors
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
