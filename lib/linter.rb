# This class is meant to check for main.rb file and see if parentheses are closed, it will send an error message in case it isn't

class ClosingParenthesis
  attr_reader :file_path
  attr_accessor :all_braces, :errors, :erreurs, :les_erreurs, :les_lignes
  def initialize(file_path)
    @errors = []
    @erreurs = {}
    @file_path = file_path
    @les_erreurs = []
    @les_lignes = []
  end

  def closed_check(file_path)
    File.open(file_path).each_with_index do |element, line|
      element.length.times do |i|
        @linea = line + 1
        case element[i]
        when '('
          @element_p = @les_erreurs.unshift([element[i], @linea.to_s])
          @open_p = @les_erreurs[0]
          @index_p = @les_erreurs.index(@open_p)
        when ')'
          @num_p = @index_p.to_i
          if @element_p[0][0].include?('(')
            @delete_p = @les_erreurs.delete_at(@num_p)
          else
            seek_and_destroy('(')
          end
        when '{'
          @element_curly = @les_erreurs.unshift([element[i], @linea.to_s])
          @open_curly = @les_erreurs[0]
          @index_curly = @les_erreurs.index(@open_curly)
        when '}'
          @num_curly = @index_curly.to_i
          if @element_curly[0][0].include?('{')
            @delete_curly = @les_erreurs.delete_at(@num_curly)
          else
            seek_and_destroy('{')
          end
        when '['
          @element_b = @les_erreurs.unshift([element[i], @linea.to_s])
          @open_b = @les_erreurs[0]
          @index_b = @les_erreurs.index(@open_b)
        when ']'
          @num_b = @index_b.to_i
          if @element_b[0][0].include?('[')
            @delete_b = @les_erreurs.delete_at(@num_b)
          else
            seek_and_destroy('[')
          end
        end
      end
    end
  end

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

  def display_path
    @file_path
  end

  def seek_and_destroy(element)
    @les_erreurs.length.times do |j|
      unless @les_erreurs[0][0].include?(element)
        @les_erreurs.delete_at(j + 1)
        break
      end
    end
  end
end
