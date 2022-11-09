def make_snippet(str)
  str_array = str.split
  if str_array.size <= 5
    return str_array.join(" ")
  else
    snippet_array = []
    5.times { |i| snippet_array.push(str_array[i]) }
    snippet = snippet_array.join(" ")
    snippet += "..."
  end
end