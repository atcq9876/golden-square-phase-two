def make_snippet(text)
  words = text.split
  if words.size <= 5
    return text
  else
    snippet = words[0, 5].join(" ")
    snippet += "..."
  end
end

def count_words(text)
  return text.split.size
end