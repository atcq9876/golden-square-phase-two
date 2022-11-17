require 'diary_entry'

describe "#initialize" do
  context "when passed empty strings as arguments" do
    it "fails" do
      expect{DiaryEntry.new("", "")}.to raise_error "Not a valid entry"
    end
  end

  context "when passed non-string arguments" do
    it "fails" do
      expect{DiaryEntry.new(4, nil)}.to raise_error "Not a valid entry"
    end
  end
end

describe "#title" do
  it "returns the title of an entry" do
    entry = DiaryEntry.new("Title", "One two three")
    expect(entry.title).to eq "Title"
  end
end

describe "#contents" do
  it "returns the contents of an entry" do
    entry = DiaryEntry.new("Title", "One two three")
    expect(entry.contents).to eq "One two three"
  end
end

describe "#word_count" do
  context "when contents is 3 words long" do
    it "returns 3" do
      entry = DiaryEntry.new("Title", "One two three")
      expect(entry.word_count).to eq 3
    end
  end

  context "when contents is 6 words long" do
    it "returns 6" do
      entry = DiaryEntry.new("Title", "One two three four five six")
      expect(entry.word_count).to eq 6
    end
  end
end
