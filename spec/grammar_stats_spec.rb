require 'grammar_stats'

describe GrammarStats do
  
  
  describe '#check' do
    context 'empty string given as argument' do
      it 'returns false' do
        grammar_check = GrammarStats.new
        result = grammar_check.check('')
        expect(result).to eq(false)
      end
    end

    context 'when capital but no valid sentence ending punctuation' do
      it 'returns false' do
        grammar_check = GrammarStats.new
        result = grammar_check.check('Hello')
        expect(result).to eq(false)
      end
    end

    context 'when capital and question mark' do
      it 'returns true' do
        grammar_check = GrammarStats.new
        result = grammar_check.check('Hello?')
        expect(result).to eq(true)
      end
    end

    context 'when capital and full stop' do
      it 'returns true' do
        grammar_check = GrammarStats.new
        result = grammar_check.check('Hello.')
        expect(result).to eq(true)
      end
    end
  end

end