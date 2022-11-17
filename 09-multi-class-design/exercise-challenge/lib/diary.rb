class Diary
  def initialize # create empty diary array
    @diary = []
  end

  def add(entry) # adds instance of DiaryEntry to diary
    @diary << entry
  end

  def read_all # returns all diary entries
    @diary.empty? ? (raise "No entries have been added yet!") : @diary
  end

  def read_best_entry(wpm, minutes) # returns longest entry user can read given wpm and minutes
    raise "No entries have been added yet!" if @diary.empty?
    words_user_can_read = wpm * minutes
    best_entry = ""
    best_entry_word_count = best_entry.split.length
    @diary.each do |entry|
      if entry.word_count > words_user_can_read
        next
      elsif entry.word_count > best_entry_word_count
        best_entry = entry.contents
      end
    end
    (best_entry != "") ? best_entry : (raise "You don't have enough time to read an entry")
  end

  def find_phone_numbers # finds all phone numbers in diary and stores them in an array
    raise "No entries have been added yet!" if @diary.empty?
  end
end