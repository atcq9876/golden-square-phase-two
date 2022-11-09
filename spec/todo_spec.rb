require 'todo'

describe '#check_todo' do 
  context 'given an empty string' do 
    it 'returns false' do
      expect(check_todo('')).to eq(false)
    end 
  end 

  context 'given string without #TODO' do 
    it 'returns false' do 
      expect(check_todo('hello')).to eq(false)
    end 
  end

  context 'given #TODO' do 
    it 'returns true' do 
      expect(check_todo('#TODO')).to eq(true)
    end 
  end 

  context '#TODO amonst other text' do
    it 'returns true' do 
      expect(check_todo('eat #TODO chocolate')).to eq(true)
    end
  end

end