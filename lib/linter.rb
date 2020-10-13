require 'strscan'
require_relative './bin/main.rb'
#This class is meant to check for main.rb file and see if parentheses are closed, it will send an error message in case it isn't
class Closing_parenthesis
    def initialize(file_path)
        @errors = []
        @open_p = [\(]
        @open_curly = [\{]
        @open_b = [\[]
        @parenthesis = [\)]
        @curly_b = [\}]
        @brackets = [\]]
      end

    def closed_check
        file.open("./bin/main.rb").each do |line|
            return line
            case line
            when line.include? @open_p && !line.include? @parenthesis
                Error_msg(@parenthesis)
                @errors << Error_msg
            when line.include? @open_curly && !line.include? @curly_b
                Error_msg(@curly_b)
                @errors << Error_msg
            when line.include? @open_b && !line.include? @brackets
            end
        end 
    end


end

#The purpose of this class is to send an error message 
class Error_msg(elm)
    File.open "./lib/warning.rb" "w+" |file|
    file.puts "Error on line (line), missing #{elm}"

    puts IO.readlines "./lib/warning.rb" 
end