# This class is meant to check for main.rb file and see if parentheses are closed, it will send an error message in case it isn't

class ClosingParenthesis
  attr_reader :file_path, :open_b, :open_curly
  attr_accessor :all_braces, :open_p, :errors
  def initialize(file_path)
    @errors = []
    @erreurs = Hash.new
    @open_p = %r{/\(/}
    @open_curly = %r{/\{/}
    @open_b = %r{/\[/}
    @parenthesis =~ /\)/
    @curly_b =~ /\}/
    @brackets =~ /\]/
    @file_path = file_path
    @all_braces = Array.new
  end


  def closed_check(file_path)
    File.open(file_path).each_with_index do |element, line|
    element.length.times do |i|
    case element[i]
      when "("
        @all_braces.push("(")
      when ")"
        @unclosed_p = @all_braces.pop
      when "{"
        @all_braces.push("{")
      when "}"
        @unclosed_c = @all_braces.pop
      when "["
        @all_braces.push("[")
      when "]"
        @unclosed_b = @all_braces.pop
      end
      end
    end
  end

=begin
  def closed_check(file_path)
    File.open(file_path).each_with_index do |element, line|
    element.length.times do |i|
    case element[i]
      when "("
        @erreurs.store("(", line)
      when ")"
        @erreurs.delete("(")
      when "{"
        @erreurs.store("{", line)
      when "}"
        @erreurs.delete("{")
      when "["
        @erreurs.store("[", line)
      when "]"
        @erreurs.delete("[")
      end
      end
    end
  end


  def trigger_errors
    if @all_braces.length.odd?
    @all_braces.each do |el|
    case el
    when '('
      elm = ')'
      @errors.push("Error, missing #{elm}")
    when '['
      elm = ']'
      @errors.push("Error, missing #{elm}")
    when '{'
      elm = '}'
      @errors.push("Error, missing #{elm}")
    end
    end
    end
    return @errors
  end
=end

def trigger_errors
    if @all_braces.length.odd?
    @all_braces.each do |el|
    case el
    when '('
      elm = ')'
      @errors.push("Error, missing #{elm}")
    when '['
      elm = ']'
      @errors.push("Error, missing #{elm}")
    when '{'
      elm = '}'
      @errors.push("Error, missing #{elm}")
    end
    end
    end
    return @errors
  end

end

