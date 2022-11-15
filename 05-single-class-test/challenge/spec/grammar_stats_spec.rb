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

  describe '#percentage_good' do
    context 'when 0 checks carried out' do
      it "fails" do
        grammar_check = GrammarStats.new
        expect { grammar_check.percentage_good }.to raise_error "No checks carried out."
      end
    end

    context 'when 1 good check and 0 bad checks' do
      it 'returns int of 100, meaning 100% passed' do
        grammar_check = GrammarStats.new
        grammar_check.check("Hello.")
        expect(grammar_check.percentage_good).to eq 100
      end
    end

    context 'when 0 good checks and 1 bad check' do
      it 'returns int of 0, meaning 0% passed' do
        grammar_check = GrammarStats.new
        grammar_check.check('hello')
        expect(grammar_check.percentage_good).to eq 0
      end
    end

    context 'when 3 good checks and 1 bad checks' do
      it 'returns int of 75, meaning 75% passed' do
        grammar_check = GrammarStats.new
        grammar_check.check("Hello.")
        grammar_check.check("Hello?")
        grammar_check.check("Hello!")
        grammar_check.check("hello")
        expect(grammar_check.percentage_good).to eq 75
      end
    end
  end
end