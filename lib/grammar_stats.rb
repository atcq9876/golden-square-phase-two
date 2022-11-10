class GrammarStats
  def initialize
    @good = 0
    @bad = 0
  end

  def check(text) # text is a string
    # Returns true or false depending on whether the text begins with a capital
    # letter and ends with a sentence-ending punctuation mark.
    if text.empty? 
      @bad += 1
      return false
    end

    if text[0].upcase == text[0] and ['!','?','.'].include?(text[-1])
      @good += 1
      true
    else
      @bad += 1
      false
    end
  end

  def percentage_good
    # Returns as an integer the percentage of texts checked so far that passed
    # the check defined in the `check` method. The number 55 represents 55%.
  end
end