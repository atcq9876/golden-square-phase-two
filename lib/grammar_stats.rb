class GrammarStats
  def initialize
    # ...
  end

  def check(text) # text is a string
    # Returns true or false depending on whether the text begins with a capital
    # letter and ends with a sentence-ending punctuation mark.
    return false if text.empty? 
    text[0].upcase == text[0] and ['!','?','.'].include?(text[-1]) ? true : false
  end

  def percentage_good
    # Returns as an integer the percentage of texts checked so far that passed
    # the check defined in the `check` method. The number 55 represents 55%.
  end
end