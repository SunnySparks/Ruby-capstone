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
