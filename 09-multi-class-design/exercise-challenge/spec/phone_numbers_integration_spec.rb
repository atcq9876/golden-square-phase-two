require 'phone_numbers'
require 'diary'
require 'diary_entry'

describe "phone_numbers integration with diary and diary_entry" do
  describe "#see_numbers, #add_numbers and preceding methods" do
    context "when adding an array of two phone numbers just once" do
      it "returnds a new array containing both phone numbers" do
        entry_1 = DiaryEntry.new("Title 1", "One 07777888999 two")
        entry_2 = DiaryEntry.new("Title 2", "Three 07888999000 four")
        diary = Diary.new
        diary.add(entry_1)
        diary.add(entry_2)
        array_of_numbers = diary.find_phone_numbers
        numbers_list = PhoneNumbers.new
        numbers_list.add_numbers(array_of_numbers)
        expect(numbers_list.see_numbers).to eq ["07777888999", "07888999000"]
      end
    end

    context "when adding an unchanged array of two phone numbers twice" do
      it "raises error" do
        entry_1 = DiaryEntry.new("Title 1", "One 07777888999 two")
        entry_2 = DiaryEntry.new("Title 2", "Three 07888999000 four")
        diary = Diary.new
        diary.add(entry_1)
        diary.add(entry_2)
        array_of_numbers = diary.find_phone_numbers
        numbers_list = PhoneNumbers.new
        numbers_list.add_numbers(array_of_numbers)
        expect{ numbers_list.add_numbers(array_of_numbers) }.to raise_error "No new numbers added"
        expect(numbers_list.see_numbers).to eq ["07777888999", "07888999000"]
      end
    end

    context "when adding an array of 2, then a new number to array, then re-adding array, now of 3 numbers" do
      it "returns 3 numbers with no duplicates" do
        entry_1 = DiaryEntry.new("Title 1", "One 07777888999 two")
        entry_2 = DiaryEntry.new("Title 2", "Three 07888999000 four")
        diary = Diary.new
        diary.add(entry_1)
        diary.add(entry_2)
        array_of_numbers = diary.find_phone_numbers
        numbers_list = PhoneNumbers.new
        numbers_list.add_numbers(array_of_numbers)
        entry_3 = DiaryEntry.new("Title 3", "Five six 07123444555")
        diary.add(entry_3)
        array_of_numbers = diary.find_phone_numbers
        numbers_list.add_numbers(array_of_numbers)
        expect(numbers_list.see_numbers).to eq ["07777888999", "07888999000", "07123444555"]
      end
    end
  end
end
