# frozen_string_literal: false

require 'diary'

describe DiaryEntry do
  before :all do
    @entry = DiaryEntry.new('Monday', 'lots of words ' * 300)
  end
  context 'adds an entry' do
    it '#title returns the title' do
      expect(@entry.title).to eq('Monday')
    end

    it '#contents returns the contents' do
      expect(@entry.contents).to eq('lots of words ' * 300)
    end

    it '#count_words returns the word count' do
      expect(@entry.count_words).to eq(900)
    end

    it '#reading_time returns the time to read the entry given wpm' do
      expect(@entry.reading_time(250)).to eq(3)
    end

    context 'new reading chunk to be called more than once' do
      excerpt = 'lots of words ' * 300
      entry = DiaryEntry.new('Monday', excerpt)

      it '#reading_chunk returns the first chunk to read given wpm and time' do
        expect(entry.reading_chunk(250, 1)).to eq(excerpt[0...250])
      end

      it '#reading_chunk returns the second chunk to read given wpm and time' do
        expect(entry.reading_chunk(250, 2)).to eq(excerpt[250...750])
      end

      it '#reading_chunk returns the third chunk that returns to start' do
        expect(entry.reading_chunk(250, 4)).to eq(excerpt[750...1750])
      end
    end
  end
end
