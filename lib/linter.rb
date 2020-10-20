require './lib/reader.rb'
# This class is meant to check for main.rb file and see if parentheses are closed, it will send an error message in case it isn't
revision = CheckUnclosed.new
class ClosingParenthesis
  attr_reader :file_path
  def initialize(file_path)
    @errors = []
    @open_p =~ /\(/
    @open_curly =~ /\{/
    @open_b =~ /\[/
    @parenthesis =~ /\)/
    @curly_b =~ /\}/
    @brackets =~ /\]/
    @file_path = file_path
    @all_braces = []
  end

  def closed_check
    file.open(@file_path).each do |line|
      file_data = file.read
      case line
      when line =~ /\(/
        @all_braces << @open_p
      when line =~ /\)/
        @unclosed_p = @all_braces.pop
      when line =~ /\{/
        @all_braces << @open_curly
      when line =~ /\}/
        @unclosed_c = @all_braces.pop
      when line =~ /\[/
        @all_braces << @open_b
      when line =~ /\]/
        @unclosed_b = @all_braces.pop
      end
      return line
    end
    if @all_braces.length.odd?
      revision
    end
    file.close
  end
end
