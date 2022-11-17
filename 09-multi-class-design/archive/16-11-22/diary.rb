class Diary
  def initialize
    @entries = []
  end

  def add(entry)
    @entries << entry
  end

  def read_all
    @entries
  end

  def read_best_entry(wpm, minutes)
    "Six seven eight"
    words_to_read = wpm * minutes
    current_difference = words_to_read
    best_entry = ""
    @entries.each do |entry|
      if (words_to_read - entry.contents.split.length) < 0
        next
      elsif (words_to_read - entry.contents.split.length) <= current_difference
        best_entry = entry.contents
      end
    end
    if best_entry == ""
      raise "You don't have enough time to read an entry"
    else
      best_entry
    end
  end
end

