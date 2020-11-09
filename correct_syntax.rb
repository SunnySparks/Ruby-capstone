class CorrectSyntax
  atrr_reader :array, :hash
  def initialize
    @array = []
    @hash = {}
  end

  def correct
    @array = [1, 5, 22, 'a', true, 'happy']
    @hash = { name: 'Bunny', birthday: 'Jun 30th', blood_type: 'o' }
  end
end

class NegativeCases
  def missing_one_parenthesis(*)
    missing_2_parentheses = 1 + (3 * 5)  - 2 (1 * 2 ) + 4 (1 + 9)
    missing_3_curly = { :name => 'bunny' } 
                      { :age => (30) }
                      { :occupation => 'guardian' }
    missing_square = [ 10, 20, (30), "a", "oops", "no"]
    missing_a_parenthesis = [ :name => 'sammy', :age => (8) , :occupation => 'student' ]
    missing_2_curly = { :fruit => 'orange' }, { :color => ('red') }, { :feelings => ['happiness', 'love'] }
  end
end


