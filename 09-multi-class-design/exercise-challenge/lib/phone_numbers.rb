class PhoneNumbers
  def initialize # creates empty array of phone numbers
    @phone_numbers = []
  end

  def add_numbers(array_of_numbers) # takes an array of phone numbers found in diary
    # loop through given array and only add new numbers to @phone_numbers array
    new_numbers = 0
    if @phone_numbers.empty?
      @phone_numbers = array_of_numbers
      new_numbers = @phone_numbers.length
    else
      array_of_numbers.each do |number|
        if @phone_numbers.include?(number)
          next
        else
          @phone_numbers << number
          new_numbers += 1
        end
      end
    end
    raise "No new numbers added" if new_numbers == 0
  end

  def see_numbers # returns all phone_numbers
    @phone_numbers.empty? ? (raise "No numbers have been added yet!") : @phone_numbers
  end
end
