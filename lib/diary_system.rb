def make_snippet(str)
  words = str.split
  if words.size <= 5
    return str
  else
    snippet = words[0, 5].join(" ")
    snippet += "..."
  end
end