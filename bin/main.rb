#!/usr/bin/ruby
require_relative '../lib/linter'

# This code should trigger errors
error_trigger = ClosingParenthesis.new(ARGV.first)
error_trigger.couples_add(ARGV.first)
# error_trigger.trigger_parentheses
# error_trigger.closed_check(ARGV.first)

if error_trigger.errors.empty?
  puts 'File name: ', error_trigger.display_path, 'No offenses detected'
else
  puts 'File name: ', error_trigger.display_path
  puts error_trigger.puts_errors
end
