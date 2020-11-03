# This class is meant to check for main.rb file and see if parentheses are closed, it will send an error message in case it isn't

class ClosingParenthesis
  attr_reader :file_path
  attr_accessor :all_braces, :errors, :erreurs, :les_erreurs, :les_lignes, :opened, :closed, :parentheses, :curly_braces, :square_brackets, :parentheses_open, :parentheses_closed, :total_parentheses
  def initialize(file_path)
    @errors = []
    @erreurs = {}
    @file_path = file_path
    @les_erreurs = []
    @opened = []
    @closed = []
    @parentheses = []
    @parentheses_open = []
    @parentheses_closed = []
    @total_parentheses
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
          @open_p = @parentheses_open.push([element[i], @linea.to_s])
        when ')'
          @closed_p = @parentheses_closed.push([element[i], @linea.to_s])
        when '{'
          @open_curly = @curly_braces.push([element[i], @linea.to_s])
        when '}'
          @closed_curly = @curly_braces.push([element[i], @linea.to_s])
          @curly_c
        when '['
          @open_b = @square_brackets.push([element[i], @linea.to_s])
        when ']'
          @closed_p = @square_brackets.push([element[i], @linea.to_s])
        end
      end
    end
    parentheses_check
    #trigger_parentheses
    #trigger_curly
    #trigger_square
    #triggerer_of_parentheses
    #triggerer_of_curly
    #triggerer_of_squares
  end

  def parentheses_check
    @total_parentheses = @parentheses_open.zip @parentheses_closed
    @total_parentheses.each do |el|
      #el.length.times do |i, num|
      #p el
      #p el[0]
      #p el[1]
        #el.length.times do |i, num|
        if el[1] != nil
        if el[0][1] != el [1][1] && el[0][0] != el[1][0]
          @errors.push(el[0])
        end
        else
          @errors.push(el[0]) 
      end
      #nd
        #if el[1] == nil
        #  puts "hello"
        #  puts el[1]
        #end
        #p el[i][1]
        #p el[i+1][1]
        #p "num #{el[i + 1]}"
        #if el[i][1] == nil
          #puts "hello #{el[num]}"
        #end
      #end
    end
    puts @errors
  end
=begin
  def trigger_parentheses
    if @par_open > @par_closed
      filter_p_open
    else
      filter_p_closed
    end
  end

  def filter_p_open
    @parentheses.each do |el|
      el.length.times do |i, num|
        if el[i].include?('(')
          deletion_left = @parentheses.delete(el)
        end
      end
    end
  end

  def filter_p_closed
    @parentheses.each do |el|
      el.length.times do |i, num|
        if el[i].include?(')')
          deletion_right = @parentheses.delete(el)
        end
      end
    end
  end

  def trigger_curly
    if @curly_open > @curly_closed
      filter_curly_open
    else
      filter_curly_closed
    end
  end

  def filter_curly_open
    @parentheses.each do |el|
      el.length.times do |i, num|
        if el[i].include?('{')
          deletion_left = @parentheses.delete(el)
        end
      end
    end
  end

  def filter_curly_closed
    @parentheses.each_with_index do |el|
      el.length.times do |i, num|
        if el[i].include?('}')
          deletion_right = @parentheses.delete(el)
        end
      end
    end
  end

  def trigger_square
    if @square_open > @square_closed
      filter_square_open
    else
      filter_square_closed
    end
  end

  def filter_square_open
    @parentheses.each_with_index do |el|
      el.length.times do |i, num|
        if el[i].include?('[')
          deletion_left = @parentheses.delete(@parentheses[el])
        end
      end
    end
  end

  def filter_square_closed
    @parentheses.each_with_index do |el|
      el.length.times do |i, num|
        if el[i].include?(']')
          deletion_right = @parentheses.delete(el)
        end
      end
    end
  end


  def triggerer_of_parentheses
    unless @parentheses.empty?
      @parentheses.each do |el|
        el.length.times do |i|
          if el[i] == '('
            elm = ')'
            @errors.unshift("Error, missing #{elm} on line #{el[i + 1]}")
          elsif el[i] == ')'
            elm = '('
            @errors.unshift("Error, missing #{elm} on line #{el[i + 1]}")
          end
        end
      end
    end
  end

  def triggerer_of_curly
    unless @curly_braces.empty?
      @curly_braces.each do |el|
        el.length.times do |i|
          if el[i] == '{'
            elm = '}'
            @errors.unshift("Error, missing #{elm} on line #{el[i + 1]}")
          elsif el[i] == '}'
            elm = '{'
            @errors.unshift("Error, missing #{elm} on line #{el[i + 1]}")
          end
        end
      end
    end
  end

  def triggerer_of_squares
    unless @square_brackets.empty?
      @square_brackets.each do |el|
        el.length.times do |i|
          if el[i] == '['
            elm = ']'
            @errors.unshift("Error, missing #{elm} on line #{el[i + 1]}")
          elsif el[i] == ']'
            elm = '['
            @errors.unshift("Error, missing #{elm} on line #{el[i + 1]}")
          end
        end
      end
    end
  end
=end
  def puts_errors
    @errors
  end
=begin
  def parentheses_add(file_path)
    File.open(file_path).each_with_index do |element, line|
      element.length.times do |i|
        @linea = line + 1
        case element[i]
        when '('
          @open_p = @opened.unshift([element[i], @linea.to_s])
        when ')'
          @closed_p = @closed.unshift([element[i], @linea.to_s])
        when '{'
          @open_curly = @les_erreurs.unshift([element[i], @linea.to_s])
        when '}'
          @closed_curly = @closed.unshift([element[i], @linea.to_s])
        when '['
          @open_b = @les_erreurs.unshift([element[i], @linea.to_s])
        when ']'
          @closed_p = @closed.unshift([element[i], @linea.to_s])
        end
      end
    end
  end
=end

=begin
  def trigger_errors
    unless @les_erreurs.empty?
      @les_erreurs.each do |el|
        el.length.times do |i|
          if el[i] == '('
            elm = ')'
            @errors.unshift("Error, missing #{elm} on line #{el[i + 1]}")
          elsif el[i] == '['
            elm = ']'
            @errors.unshift("Error, missing #{elm} on line #{el[i + 1]}")
          elsif el[i] == '{'
            elm = '}'
            @errors.unshift("Error, missing #{elm} on line #{el[i + 1]}")
          end
        end
      end
    end
    @errors
  end



  def seek_and_destroy(element)
    @les_erreurs.length.times do |j|
      unless @les_erreurs[0][0].include?(element)
        @les_erreurs.delete_at(j + 1)
        break
      end
    end
  end
=end
def display_path
  @file_path
end
end
