require 'grammar'

describe '#grammar' do 
  context 'empty string given as arg' do 
    it 'returns false' do
      expect(check_grammar('')).to eq(false)
    end 
  end 

  context 'when capital but no valid sentence ending punctuation' do 
    it 'returns false' do 
      expect(check_grammar('Hello')).to eq(false)
    end 
  end

  context 'when capital and question mark' do 
    it 'returns true' do
      expect(check_grammar('Hello?')).to eq(true)
    end 
  end

  context 'when capital and full stop' do 
    it 'returns true' do 
      expect(check_grammar('Hello.')).to eq(true)
    end 
  end
end