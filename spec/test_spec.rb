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
        les_erreurs.not_to be_empty
      end
    end

    it 'should not equal the values of the array errors' do
      expect do
        les_erreurs.not_to eql(errors)
      end
    end

    it 'should not include any closed parentheses' do
      expect do
        les_erreurs.should_not include(')', ']', '}')
      end
    end

    it 'should not include any elements in the array that do not coincide with an open parenthesis' do
      expect do
        les_erreurs.should_not include('a', 2, 'f', 10)
      end
    end

    it 'should not push elements other than arrays into the @errors array' do
      expect do
        errors.class.should_not be('String', 'Integer', 'Boolean')
      end
    end

    it 'should not delete any element from the end of the array' do
      expect do
        delete_curly.not_to eql(les_erreurs[-1])
      end
    end

    it 'Should not be other than an open square bracket' do
      expect do
        element_b.not_to include('(', '{')
      end
    end
  end
end
