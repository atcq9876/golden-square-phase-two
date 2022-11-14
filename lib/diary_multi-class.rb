class Diary
  def initialize
    @entries = []
  end

  def add(entry) # entry is an instance of DiaryEntry
    # Returns nothing
    @entries << entry
  end

  def all
    # Returns a list of instances of DiaryEntry
    raise "No diary entries added" if @entries.empty?
    @entries
  end

  def count_words
    # Returns the number of words in all diary entries
    # HINT: This method should make use of the `count_words` method on DiaryEntry.
    raise "No diary entries added" if @entries.empty?
    sum = 0
    @entries.each do |entry| 
      sum += entry.count_words
    end
    sum
  end

  def reading_time(wpm) # wpm is an integer representing
                        # the number of words the user can read per minute
    # Returns an integer representing an estimate of the reading time in minutes
    # if the user were to read all entries in the diary.
    raise "wpm must be > 0" if wpm <= 0
    count_words.to_f / wpm
  end

  def find_best_entry_for_reading_time(wpm, minutes)
        # `wpm` is an integer representing the number of words the user can read
        # per minute.
        # `minutes` is an integer representing the number of minutes the user
        # has to read.
    # Returns an instance of diary entry representing the entry that is closest 
    # to, but not over, the length that the user could read in the minutes they
    # have available given their reading speed.
    raise "wpm must be > 0" if wpm <= 0
    raise "No diary entries added" if @entries.empty?
    possibilities = @entries.select{|entry| entry.reading_time(wpm) <= minutes}
    raise "They are all too long" if possibilities.empty?
    possibilities.sort_by{|entry| entry.reading_time(wpm)}[0]
  end
end