require './bin/main.rb'
#This class is meant to check for main.rb file and see if parentheses are closed, it will send an error message in case it isn't
class Closing_parenthesis
    def initialize(file_path)
        @errors = []
        @all_braces = []
        @open_p =~ /\(/
        @open_curly =~ /\{/
        @open_b =~ /\[/
        @parenthesis =~ /\)/
        @curly_b =~ /\}/
        @brackets =~ /\]/
      end

    def closed_check
        file.open("./bin/main.rb").each do |line|
            return line
            case line
            when line =~ /\(/ then 
                @all_braces << @open_p
            when line =~ /\)/ then
                @unclosed_p = @all_braces.pop
            when line =~ /\{/ then
                @all_braces << @open_curly
            when line =~ /\}/ then
                @unclosed_c = @all_braces.pop
            when line =~ /\[/ then
                @all_braces << @open_b
            when line =~ /\]/ then
                @unclosed_b = @all_braces.pop
            end
        end 
        if @all_braces.odd? then
            Check_unclosed
        end
    end
end



class Check_unclosed
    def checker(elm)
        unclosed = @all_braces.last
        case unclosed
        when unclosed == "(" then
            elm = ")"
            puts "Error on line (line), missing #{elm}"
        when unclosed == "[" then
            elm = "]"
            puts "Error on line (line), missing #{elm}"
        when unclosed == "{" then
            elm = "}"
            puts "Error on line (line), missing #{elm}"
        end
    end
end