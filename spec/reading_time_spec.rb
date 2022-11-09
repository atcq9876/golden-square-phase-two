require 'reading_time'

RSpec.describe "reading_time method" do
  it "takes an empty string and returns 'Approx. reading time: 0 minutes'" do
    result = estimate_reading_time("")
    expect(result).to eq "Reading time: 0 minutes"
  end

  it "takes a 100 word string and returns 'Approx. reading time: < 1 minute'" do
    result = estimate_reading_time("word " * 100)
    expect(result).to eq "Approx. reading time: < 1 minute"
  end

  it "takes a 200 word string and returns 'Approx. reading time: 1 minute'" do
    result = estimate_reading_time("word " * 200)
    expect(result).to eq "Approx. reading time: 1 minute"
  end

  it "takes a 300 word string and returns 'Approx. reading time: 1 to 2 minutes'" do
    result = estimate_reading_time("word " * 300)
    expect(result).to eq "Approx. reading time: 1 to 2 minutes"
  end

  it "takes a 400 word string and returns 'Approx. reading time: 2 minutes'" do
    result = estimate_reading_time("word " * 400)
    expect(result).to eq "Approx. reading time: 2 minutes"
  end

  it "takes a 942 word string and returns 'Approx. reading time: 4 to 5 minutes'" do
    result = estimate_reading_time("word " * 942)
    expect(result).to eq "Approx. reading time: 4 to 5 minutes"
  end
end