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
