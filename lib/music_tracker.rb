class MusicTracker
  def initialize
    @list_of_songs = []
    @song_count = 0
  end

  def add_song(song, artist)
    if song.length == 0 || artist.length == 0
      fail "Please enter a song and whose song this is"
    else
      @list_of_songs.push("#{song} by #{artist}")
      @song_count += 1
      "#{song} by #{artist} added"
    end
  end

  def see_songs
    if @song_count == 0
      fail "No songs added yet"
    else
      "Song list: #{@list_of_songs.join(', ')}"
    end
  end
end


=begin
{{PROBLEM}} Class Design Recipe
1. Describe the Problem

As a user
So that I can keep track of my music listening
I want to add tracks I've listened to and see a list of them.


2. Design the Class Interface
Include the initializer and public methods with all parameters and return values.

class MusicTracker
  def initialize
    # create empty array/hash of songs
  end

  def add_song(song, artist)
    # error if no song added
    # otherwise, add song to array/hash
  end

  def see_songs
    # error if no songs added to list
    # return list of songs
  end
end


3. Create Examples as Tests
Make a list of examples of how the class will behave in different situations.


add_song tests
# 1 (empty string or non-string arguments)
song_list = MusicTracker.new
song_list.add_song('', '') => fails with "Please enter a song and whose song this is"

# 2 (non-string arguments)
song_list = MusicTracker.new
song_list.add_song(5, nil) => fails with "Please enter a song and whose song this is"

# 3  (valid arguments)
song_list = MusicTracker.new
song_list.add_song('Song', 'Band') => "'Song' by 'Band' added"


see_songs tests
# 4 (empty list, i.e. no songs added)
song_list = MusicTracker.new
song_list.see_songs => fails with "No songs added yet"

# 5 (one song list)
song_list = MusicTracker.new
song_list.add_song("Song", "Band") => "Song list: Song by Band"

# 6 (two song list)
song_list = MusicTracker.new
song_list.add_song("Song 1", "Band 1")
song_list.add_song("Song 2", "Band 2") => "Song list: Song 1 by Band 1, Song 2 by Band 2"

Encode each example as a test. You can add to the above list as you go.



4. Implement the Behaviour
After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour.


=end