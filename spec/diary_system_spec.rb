require 'diary_system'

RSpec.describe "make_snippet method" do
  it "returns an empty string if given an empty string" do
    result = make_snippet("")
    expect(result).to eq ""
  end

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

RSpec.describe "count_words method" do
  it "returns 0 if given an empty string" do
    result = count_words("")
    expect(result).to eq 0
  end

  it "returns 1 if given a one-word string" do
    result = count_words("One")
    expect(result).to eq 1
  end

  it "returns 5 if given a five-word string" do
    result = count_words("One two three four five")
    expect(result).to eq 5
  end
end