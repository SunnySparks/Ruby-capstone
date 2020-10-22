#!/usr/bin/ruby
require './lib/linter.rb'

parenthesis = ClosingParenthesis.new('./file.rb')
parenthesis.closed_check('./file.rb')

if parenthesis.erreurs.empty?
  puts 'No offenses detected'
else
  puts parenthesis.trigger_errors
end
