# This class is meant to check for main.rb file and see if parentheses are closed, it will send an error message in case it isn't

class ClosingParenthesis
  attr_reader :file_path
  attr_accessor :all_braces, :errors, :erreurs
  def initialize(file_path)
    @errors = []
    @erreurs = {}
    @file_path = file_path
  end

  def closed_check(file_path)
    File.open(file_path).each_with_index do |element, line|
      element.length.times do |i|
        case element[i]
        when '('
          @erreurs.store('(', line)
        when ')'
          @erreurs.delete('(')
        when '{'
          @erreurs.store('{', line)
        when '}'
          @erreurs.delete('{')
        when '['
          @erreurs.store('[', line)
        when ']'
          @erreurs.delete('[')
        end
      end
    end
  end

  def trigger_errors
    unless @erreurs.empty?
      @erreurs.each do |el, line|
        linea = line + 1
        case el
        when '('
          elm = ')'
          @errors.push("Error, missing #{elm} on line #{linea}")
        when '['
          elm = ']'
          @errors.push("Error, missing #{elm} on line #{linea}")
        when '{'
          elm = '}'
          @errors.push("Error, missing #{elm} on line #{linea}")
        end
      end
    end
    @errors
  end
end
