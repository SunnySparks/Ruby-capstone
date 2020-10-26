# spec/test_spec.rb
require './lib/linter.rb'

describe '#ClosingParenthesis' do
  let(:erreurs) { ClosingParenthesis.new }
  describe '#closed_check(file_path' do
    it 'When Error is in line one and "]" is missing' do
      expect do
        erreurs.update('1', ']')
        expect(erreurs.update[0][0]).to eql(']')
      end
    end
  end

  describe '#trigger_errors' do
  let(:les_erreurs) { ClosingParenthesis.new }
    it 'It stores the value of "[" in the first key of a hash when a missing parenthesis is found' do
      expect do
        expect(erreurs['[']).to eql(0)
      end
    end

    it 'It stores the value of "(" in the second key of a hash when a missing parenthesis is found' do
      expect do
        expect(erreurs['(']).to eql(1)
      end
    end

    it 'when there is at least one missing parenthesis' do
      expect do
        (les_erreurs).not_to be_empty
      end
    end

    it 'generates an error when expected', negative: true do 
      expect do
        (les_erreurs).not_to eql(errors) 
      end
    end
  end
end
