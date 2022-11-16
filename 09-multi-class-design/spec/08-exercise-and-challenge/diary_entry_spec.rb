require 'diary_entry'

describe DiaryEntry do
  describe "title method" do
    it "returns the diary entry's title" do
      entry = DiaryEntry.new("Title", "Contents")
      expect(entry.title).to eq "Title"
    end
  end

  describe "contents method" do
    it "returns the diary entry's contents" do
      entry = DiaryEntry.new("Title", "Contents")
      expect(entry.contents).to eq "Contents"
    end
  end

  describe "count_words method" do
    context "when contents contains 4 words" do
      it "returns int of 4" do
        entry = DiaryEntry.new("Title", "Contents one two three")
        expect(entry.count_words).to eq 4
      end
    end

    context "when contents is an empty string" do
      it "returns int of 0" do
        entry = DiaryEntry.new("Title", "")
        expect(entry.count_words).to eq 0
      end
    end
  end

  describe "reading_time() method" do
    context "when wpm is 0" do
      it "fails" do
        entry = DiaryEntry.new("Title", "Contents")
        expect { entry.reading_time(0) }.to raise_error "Please enter valid wpm." 
      end
    end
    
    context "when when wpm is > 0 and contents is an empty string" do
      it "returns 0" do
        entry = DiaryEntry.new("Title", "")
        expect(entry.reading_time(1)).to eq 0
      end
    end

    context "when wpm is 200 and contents is 200 words" do
      it "returns 1" do
        entry = DiaryEntry.new("Title", ("one " * 200))
        expect(entry.reading_time(200)).to eq 1
      end
    end

    context "when wpm is 200 and contents is 150 words" do
      it "returns 1" do
        entry = DiaryEntry.new("Title", ("one " * 150))
        expect(entry.reading_time(200)).to eq 1
      end
    end

    context "when wpm is 200 and contents is 1950 words" do
      it "returns 10" do
        entry = DiaryEntry.new("Title", ("one " * 1950))
        expect(entry.reading_time(200)).to eq 10
      end
    end
  end

  describe "reading_chunk method" do
    context "when contents is empty, and both wpm and mins are > 0" do
      it "returns empty string" do
        entry = DiaryEntry.new("Title", (""))
        expect(entry.reading_chunk(1, 1)).to eq ""
      end
    end

    context "when contents is 300 words, wpm is 200 and mins is 1" do
      it "returns first 200 words of contents" do
        entry = DiaryEntry.new("Title", ("one " * 300))
        expect(entry.reading_chunk(200, 1)).to eq "#{'one ' * 199}one"
      end
    end

    context "when contents is 3000 words, wpm is 300 and mins is 5" do
      it "returns first 1500 words of contents" do
        entry = DiaryEntry.new("Title", ("one " * 3000))
        expect(entry.reading_chunk(300, 5)).to eq "#{'one ' * 1499}one"
      end
    end
  end

  describe "calling reading_chunk method twice" do
    context "when contents is 350 words, wpm is 200, mins is 1" do
      it "returns the final 150 words on the second method call" do
        entry = DiaryEntry.new("Title", "#{'one ' * 200}#{'two ' * 150}")
        entry.reading_chunk(200, 1)
        expect(entry.reading_chunk(200, 1)).to eq "#{'two ' * 149}two"
      end
    end
  end

  describe "calling reading_chunk method thrice" do
    context "when contents is 350 words, wpm is 200, mins is 1" do
      it "returns the first 200 words on the third method call" do
        entry = DiaryEntry.new("Title", "#{'one ' * 200}#{'two ' * 150}")
        entry.reading_chunk(200, 1)
        entry.reading_chunk(200, 1)
        expect(entry.reading_chunk(200, 1)).to eq "#{'one ' * 199}one"
      end
    end
  end
end