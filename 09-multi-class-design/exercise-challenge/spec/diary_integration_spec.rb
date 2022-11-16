require 'diary'
require 'diary_entry'

describe 'integration' do
  describe '#add' do
    it 'adds diary entries to diary' do
      entry_1 = DiaryEntry.new("Title 1", "One")
      entry_2 = DiaryEntry.new("Title 2", "Two")
      diary = Diary.new
      diary.add(entry_1)
      expect(diary.add(entry_2)).to eq [entry_1, entry_2]
    end
  end

  describe '#read_all' do
    it 'returns all diary entries' do
      entry_1 = DiaryEntry.new("Title 1", "One")
      entry_2 = DiaryEntry.new("Title 2", "Two")
      diary = Diary.new
      diary.add(entry_1)
      diary.add(entry_2)
      expect(diary.read_all).to eq [entry_1, entry_2]
    end
  end

  describe "#read_best_entry" do
    context "with two entries, only one short enough to read" do
      it "returns the entry that the user can read in the given time" do
        entry_1 = DiaryEntry.new("Title 1", "One two three four five")
        entry_2 = DiaryEntry.new("Title 2", "Six seven eight")
        diary = Diary.new
        diary.add(entry_1)
        diary.add(entry_2)
        expect(diary.read_best_entry(3, 1)).to eq "Six seven eight"
      end
    end

    context "with two entries both being too long" do
      it "fails" do
        entry_1 = DiaryEntry.new("Title 1", "One two three four five")
        entry_2 = DiaryEntry.new("Title 2", "Six seven eight")
        diary = Diary.new
        diary.add(entry_1)
        diary.add(entry_2)
        expect { diary.read_best_entry(2, 1) }.to raise_error "You don't have enough time to read an entry"
      end
    end
  end
end

