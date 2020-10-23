#!/usr/bin/ruby
require './lib/linter.rb'

#This code should trigger errors
error_trigger = ClosingParenthesis.new('./file.rb')
error_trigger.closed_check('./file.rb')

if error_trigger.les_erreurs.empty?
  puts "No offenses detected in", error_trigger.display_path
else
  puts "File: ", error_trigger.display_path
  puts error_trigger.trigger_errors
end

#This code shouldn't trigger any error

right_syntax = ClosingParenthesis.new('./correct_syntax.rb')
right_syntax.closed_check('./correct_syntax.rb')

if right_syntax.les_erreurs.empty?
  print "No offenses detected in", right_syntax.display_path
else
  puts "File: ", right_syntax.display_path
  puts right_syntax.trigger_errors
end