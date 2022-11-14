require 'music_tracker'

describe MusicTracker do
  describe "#add_song" do
    context "when empty strings entered" do
      it "fails" do
        song_list = MusicTracker.new
        expect { song_list.add_song('', '') }.to raise_error "Please enter a song and whose song this is"
      end
    end

    # context "when non-string values are entered" do
      # it "fails" do
        # song_list = MusicTracker.new
        # expect { song_list.add_song(5, nil) }.to raise_error "Please enter a song and whose song this is"
      # end
    # end

    context "when valid string arguments are entered" do
      it "adds song to list and returns a success message" do
        song_list = MusicTracker.new
        result = song_list.add_song("Song", "Band")
        expect(result).to eq "Song by Band added"
      end
    end
  end

  describe "see_songs" do
    context "when list is empty" do
      it "fails" do
        song_list = MusicTracker.new
        expect { song_list.see_songs }.to raise_error "No songs added yet"
      end
    end

    context "when list contains one song" do
      it "returns string containing one song" do
        song_list = MusicTracker.new
        song_list.add_song("Song", "Band")
        expect(song_list.see_songs).to eq "Song list: Song by Band"
      end
    end

    context "when list contains two songs" do
      it "returns string containing two songs" do
        song_list = MusicTracker.new
        song_list.add_song("Song 1", "Band 1")
        song_list.add_song("Song 2", "Band 2")
        expect(song_list.see_songs). to eq "Song list: Song 1 by Band 1, Song 2 by Band 2"
      end
    end
  end
end