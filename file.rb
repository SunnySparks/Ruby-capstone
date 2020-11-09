# Code with no errors

class DummyCode
  def initialize(*)
    dummy_array = [1, 2, 3, 4, 5]
    dummy_hash = { foo: 0, bar: 1, baz: 2 }
  end
end

# Code with errors


class DummyCode2
  def initialize(*
    dummy_array = [1, 2, 3, 4, 5
    dummy_hash = { foo: 0, bar: 1, baz: 2 
  end
end

class NegativeCases
  def missing_one_parenthesis(*
    missing_2_parentheses = 1 + (3 * 5  - 2 (1 * 2 ) + 4 (1 + 9
    missing_3_curly = { :name => 'bunny' 
                      { :age => (30)
                      { :occupation => 'guardian'
    missing_square = [ 10, 20, (30), "a", "oops", "no"
    missing_a_parenthesis = [ :name => 'sammy', :age => (8 , :occupation => 'student' ]
    missing_2_curly = { :fruit => 'orange', {:color => ('red'), { :feelings => ['happiness', 'love']}
  end ) ] } ) ) ) ]  } ) ) ) ] } ] 
end