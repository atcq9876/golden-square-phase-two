def estimate_reading_time(text)
  word_count = text.split.size
  reading_time = (word_count / 200)
  if (word_count % 200 == 0) && (reading_time == 1)
    return "Approx. reading time: 1 minute"
  elsif (word_count % 200 == 0) && (reading_time == 0)
    return "Reading time: 0 minutes"
  elsif reading_time < 1
    return "Approx. reading time: < 1 minute"
  elsif word_count % 200 == 0
    return "Approx. reading time: #{reading_time} minutes"
  else
    return "Approx. reading time: #{reading_time} to #{reading_time + 1} minutes"
  end
end