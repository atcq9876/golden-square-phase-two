require 'diary_entry'

describe "#initialize" do
  it "constructs" do
    entry = DiaryEntry.new("Title", "Contents")
    expect(entry).to be_a(DiaryEntry)
  end
end

describe "#title" do
  it "returns the title of the diary entry" do
    entry = DiaryEntry.new("Test", "One two three")
    expect(entry.title).to eq "Test"
  end
end

describe "#contents" do
  it "returns the contents of the diary entry" do
    entry = DiaryEntry.new("Test", "One two three")
    expect(entry.contents).to eq "One two three"
  end
end