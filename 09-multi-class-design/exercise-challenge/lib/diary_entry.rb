class DiaryEntry
  def initialize(title, contents) # takes strings, creates a diary entry
    if (!title.is_a? String) || (!contents.is_a? String) || title == "" || contents == ""
      raise "Not a valid entry"
    else
      @title = title
      @contents = contents
    end
  end

  def title # returns title of a diary entry
    @title
  end

  def contents # returns contents of a diary entry
    @contents
  end

  def word_count # counts length of a diary entry's contents
    @contents.split.length
  end
end