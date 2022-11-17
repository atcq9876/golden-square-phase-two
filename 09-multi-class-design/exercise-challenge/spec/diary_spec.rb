require 'diary'

describe "#read_all" do
  context "when no diary entries" do
    it "fails" do
      diary = Diary.new
      expect{diary.read_all}.to raise_error "No entries have been added yet!"
    end
  end
end

describe "#read_best_entry" do
  context "when no diary entries" do
    it "fails" do
      diary = Diary.new
      expect{diary.read_best_entry(2, 1)}.to raise_error "No entries have been added yet!"
    end
  end

  context "when reading speed <= 0 wpm" do
    it "fails" do
      diary = Diary.new
      expect{diary.read_best_entry(0, 1)}.to raise_error "Invalid reading speed!"
    end
  end
end

describe "#find_phone_numbers" do
  context "when no diary entries" do
    it "fails" do
      diary = Diary.new
      expect{diary.find_phone_numbers}.to raise_error "No entries have been added yet!"
    end
  end
end

