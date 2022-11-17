require 'phone_numbers'

describe "#see_numbers" do
  context "when no numbers have been added to list" do
    it "raises error" do
      numbers_list = PhoneNumbers.new
      expect{numbers_list.see_numbers}.to raise_error "No numbers have been added yet!"
    end
  end
end






# PhoneNumbers
#   #see_numbers
#     # 1 (with no numbers added)
#       numbers_list = PhoneNumbers.new
#       numbers_list.see_numbers => "No numbers have been added yet!"
