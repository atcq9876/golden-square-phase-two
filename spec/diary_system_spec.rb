require 'diary_system'

RSpec.describe "make_snippet method" do
  it "takes a string and returns it in full if <= 5 words long" do
    result = make_snippet("One two three")
    expect(result).to eq "One two three"
  end
  
  it "takes a string and returns it in full if 5 words long" do
    result = make_snippet("One two three four five")
    expect(result).to eq "One two three four five"
  end

  it "takes a string and returns the first five words plus '...' if > 5 words" do
    result = make_snippet("Testing one two three four five")
    expect(result).to eq "Testing one two three four..."
  end
end