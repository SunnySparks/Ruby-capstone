#!/usr/bin/ruby
require './lib/linter.rb'

parenthesis = ClosingParenthesis.new('./file.rb')
parenthesis.closed_check

if parenthesis.all_braces.empty? 
    puts 'No offenses detected'
else
      puts puts @errors
end