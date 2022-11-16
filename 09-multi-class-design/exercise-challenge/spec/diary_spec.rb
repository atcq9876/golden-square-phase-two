require 'diary'

RSpec.describe Diary do
  describe "all" do
    context "no diary entries" do
      it "fails" do
        diary = Diary.new
        expect { diary.all }.to raise_error "No diary entries added"
      end
    end
  end

  describe "count_words" do
    context "no diary entries" do
      it "fails" do
        diary = Diary.new
        expect { diary.count_words }.to raise_error "No diary entries added"
      end
    end
  end

  describe "reading_time" do
    context "no diary entries" do
      it "fails" do
        diary = Diary.new
        expect { diary.reading_time(1) }.to raise_error "No diary entries added"
      end
    end
  end
  
  describe "find best entry for reading time" do
    context "no diary entries" do
      it "fails" do
        diary = Diary.new
        expect { diary.find_best_entry_for_reading_time(1,1) }.to raise_error "No diary entries added"
      end
    end
  end
end