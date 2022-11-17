require 'diary'
require 'diary_entry'

describe "integration" do
  describe "#read_all and preceding methods" do
    context "when one diary entry added and #read_all called" do
      it "returns said one diary entry" do
        entry_1 = DiaryEntry.new("Title 1", "One")
        diary = Diary.new
        diary.add(entry_1)
        expect(diary.read_all).to eq [entry_1]
      end
    end

    context "when two entries added and #read_all called" do
      it "returns said two diary entries" do
        entry_1 = DiaryEntry.new("Title 1", "One")
        entry_2 = DiaryEntry.new("Title 2", "Two")
        diary = Diary.new
        diary.add(entry_1)
        diary.add(entry_2)
        expect(diary.read_all).to eq [entry_1, entry_2]
      end
    end
  end

  describe "#read_best_entry and preceding methods" do
    context "with two entries, only one short enough to read in time" do
      it "returns the shorter entry" do
        entry_1 = DiaryEntry.new("Title 1", "One two three four five")
        entry_2 = DiaryEntry.new("Title 2", "Six seven eight")
        diary = Diary.new
        diary.add(entry_1)
        diary.add(entry_2)
        expect(diary.read_best_entry(3, 1)).to eq "Six seven eight"
      end
    end

    context "with two entries, neither short enough to read in time" do
      it "raises error" do
        entry_1 = DiaryEntry.new("Title 1", "One two three four five")
        entry_2 = DiaryEntry.new("Title 2", "Six seven eight")
        diary = Diary.new
        diary.add(entry_1)
        diary.add(entry_2)
        expect{diary.read_best_entry(2, 1)}.to raise_error "You don't have enough time to read an entry"
      end
    end
  end
end

