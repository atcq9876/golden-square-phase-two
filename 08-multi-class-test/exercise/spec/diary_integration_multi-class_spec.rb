require 'diary_entry_multi-class.rb'
require 'diary_multi-class.rb'

RSpec.describe "integration" do
  describe "all method" do
    context "one diary entry" do
      it "returns all of one diary entry" do
        entry_1 = DiaryEntry.new("Title 1", "Contents 1")
        diary = Diary.new
        diary.add(entry_1)
        expect(diary.all).to eq [entry_1]
      end
    end
    context "two diary entries" do
      it "returns all of 2 diary entries" do
        entry_1 = DiaryEntry.new("Title 1", "Contents 1")
        entry_2 = DiaryEntry.new("Title 2", "Contents 2")
        diary = Diary.new
        diary.add(entry_1)
        diary.add(entry_2)
        expect(diary.all).to eq [entry_1, entry_2]
      end
    end
  end

  describe "count_words" do
    context "one diary entry" do 
      it "counts number of words in one diary entry" do
          diary = Diary.new
          entry_1 = DiaryEntry.new("Title 1", "one two three")
          diary.add(entry_1)
          expect(diary.count_words).to eq 3
      end
    end
    context "two diary entries" do
      it "counts number of words in two diary entries" do
          diary = Diary.new
          entry_1 = DiaryEntry.new("Title 1", "one two three")
          entry_2 = DiaryEntry.new("Title 2", "four five six")
          diary.add(entry_1)
          diary.add(entry_2)
          expect(diary.count_words).to eq 6
      end
    end
  end     

  describe "reading_time" do
    context "one diary entry" do  
      it "returns the reading time for all of one entries" do
        diary = Diary.new
        entry_1 = DiaryEntry.new("Title 1", "one two three")
        diary.add(entry_1)
        expect(diary.reading_time(3)).to eq 1
      end
    end
    context "two diary entries" do
      it "returns the total reading time for all two entries" do
        diary = Diary.new
        entry_1 = DiaryEntry.new("Title 1", "one two three")
        entry_2 = DiaryEntry.new("Title 2", "four five six")
        diary.add(entry_1)
        diary.add(entry_2)
        expect(diary.reading_time(3)).to eq 2
      end
    end
  end
  context "reading_time: one diary entry but wpm <= 0" do
    it "fails" do
      diary = Diary.new
      entry_1 = DiaryEntry.new("Title 1", "one two three")
      diary.add(entry_1)
      expect { diary.reading_time(0) }.to raise_error "wpm must be > 0"
    end
  end

  describe "find_best_entry_for_reading_time" do
    context "two diary entries" do
      it "returns the best entry given wpm" do
        diary = Diary.new
        entry_1 = DiaryEntry.new("Title 1", "one two")
        entry_2 = DiaryEntry.new("Title 2", "three four five six")
        diary.add(entry_1)
        diary.add(entry_2)
        expect(diary.find_best_entry_for_reading_time(2,1)).to eq entry_1
      end
    end
    context "two diary entries but both too long to read in given time" do
      it "raises error" do
        diary = Diary.new
        entry_1 = DiaryEntry.new("Title 1", "one two")
        entry_2 = DiaryEntry.new("Title 2", "three four five six")
        diary.add(entry_1)
        diary.add(entry_2)
        expect{ diary.find_best_entry_for_reading_time(1,1) }.to raise_error "They are all too long"
      end
    end
    context "two diary entries and wpm of 0" do
      it "raises error" do
        diary = Diary.new
        entry_1 = DiaryEntry.new("Title 1", "one two")
        entry_2 = DiaryEntry.new("Title 2", "three four five six")
        diary.add(entry_1)
        diary.add(entry_2)
        expect{ diary.find_best_entry_for_reading_time(0,1) }.to raise_error "wpm must be > 0"
      end
    end
  end  
end
