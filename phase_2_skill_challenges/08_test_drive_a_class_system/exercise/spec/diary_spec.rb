# frozen_string_literal: false

require 'diary'

describe Diary do
  context 'initially' do
    before :each do
      @diary = Diary.new
    end

    it 'is empty' do
      expect(@diary.all).to eq([])
    end

    it 'has a word count of zero' do
      expect(@diary.count_words).to eq(0)
    end

    it 'has a reading time of zero' do
      expect { @diary.reading_time(0) }.to raise_error 'wpm must be positive'
    end
  end
end
