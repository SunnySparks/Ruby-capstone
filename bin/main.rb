#!/usr/bin/ruby
require_relative '../lib/linter'

# This code should trigger errors
error_trigger = ClosingParenthesis.new(ARGV.first)
error_trigger.closed_check(ARGV.first)

if error_trigger.les_erreurs.empty?
  puts 'File name: ', error_trigger.display_path, 'No offenses detected'
else
  puts 'File name: ', error_trigger.display_path
  puts error_trigger.trigger_errors
end
