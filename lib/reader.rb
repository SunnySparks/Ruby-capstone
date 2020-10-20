# rubocop:disable ClassLength
# rubocop:disable MethodLength
class CheckUnclosed
  def checker(elm)
    unclosed = @all_braces.last
    case unclosed
    when unclosed == '(' then
      elm = ')'
      puts "Error on line (line), missing #{elm}"
    when unclosed == '[' then
      elm = ']'
      puts "Error on line (line), missing #{elm}"
    when unclosed == '{' then
      elm = '}'
      puts "Error on line (line), missing #{elm}"
    end
  end
end
# rubocop:enable ClassLength
# rubocop:enable MethodLength
