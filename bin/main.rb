#!/usr/bin/ruby
require './lib/linter.rb'

# This code should trigger errors
error_trigger = ClosingParenthesis.new('./file.rb')
error_trigger.closed_check('./file.rb')

if error_trigger.les_erreurs.empty?
  puts error_trigger.display_path, '. No offenses detected'
else
  puts 'File: ', error_trigger.display_path
  puts error_trigger.trigger_errors
end

# This code shouldn't trigger any error
right_syntax = ClosingParenthesis.new('./correct_syntax.rb')
right_syntax.closed_check('./correct_syntax.rb')

if right_syntax.les_erreurs.empty?
  puts right_syntax.display_path, '. No offenses detected'
else
  puts 'File: ', right_syntax.display_path
  puts right_syntax.trigger_errors
end
