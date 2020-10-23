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
        linea = line + 1
        case element[i]
        when '('
          @les_erreurs.push([element[i], linea.to_s])
        when ')'
          @les_erreurs.pop
        when '{'
          @les_erreurs.push([element[i], linea.to_s])
        when '}'
          @les_erreurs.pop
        when '['
          @les_erreurs.push([element[i], linea.to_s])
        when ']'
          @les_erreurs.pop
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
            @errors.push("Error, missing #{el[i]} on line #{el[i + 1]}")
          elsif el[i] == '['
            elm = ']'
            @errors.push("Error, missing #{el[i]} on line #{el[i + 1]}")
          elsif el[i] == '{'
            elm = '}'
            @errors.push("Error, missing #{el[i]} on line #{el[i + 1]}")
          end
        end
      end
    end
    @errors
  end

  def display_path
    @file_path
  end
end
