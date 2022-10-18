# frozen_string_literal: false

require 'music_library'
require 'track'

describe 'integration' do
  before :each do
    @library = MusicLibrary.new
  end

  context 'added a track' do
    it 'add one track' do
      track = Track.new('title', 'artist')
      @library.add(track)
      expect(@library.all).to eq([track])
    end

    it 'add two tracks' do
      track1 = Track.new('title', 'artist')
      track2 = Track.new('title', 'artist')
      @library.add(track1)
      @library.add(track2)
      expect(@library.all).to eq([track1, track2])
    end
  end

  describe '#search' do
    it 'returns 0 track that matches the search' do
      track = Track.new('anyMusic', 'averageJoe')
      @library.add(track)
      expect(@library.search('Elvis')).to eq([])
    end

    it 'returns a track that matches the search' do
      track = Track.new('Elvis', 'love me tender')
      @library.add(track)
      expect(@library.search('Elvis')).to eq([track])
    end

    it 'returns one track from two that matches the search' do
      track1 = Track.new('love me tender', 'Elvis')
      track2 = Track.new('ruby ruby ruby', 'john')
      @library.add(track1)
      @library.add(track2)
      expect(@library.search('Elvis')).to eq([track1])
    end
  end
end
