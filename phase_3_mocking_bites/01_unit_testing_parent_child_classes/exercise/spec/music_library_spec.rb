# frozen_string_literal: false

require 'music_library'

describe MusicLibrary do
  before :each do
    @library = MusicLibrary.new
  end

  it 'is initially empty' do
    expect(@library.all).to eq []
  end

  context 'added a track' do
    it 'add one track' do
      track = double(:track)
      @library.add(track)
      expect(@library.all).to eq([track])
    end

    it 'add two tracks' do
      track1 = double(:track)
      track2 = double(:track)
      @library.add(track1)
      @library.add(track2)
      expect(@library.all).to eq([track1, track2])
    end
  end

  describe '#search' do
    it 'returns 0 track that matches the search' do
      track = double(:track, matches?: false)
      @library.add(track)
      expect(@library.search('Elvis')).to eq([])
    end

    it 'returns a track that matches the search' do
      track = double(:track, matches?: true)
      @library.add(track)
      expect(@library.search('Elvis')).to eq([track])
    end

    it 'returns one track from two that matches the search' do
      track1 = double(:track, matches?: true)
      track2 = double(:track, matches?: false)
      @library.add(track1)
      @library.add(track2)
      expect(@library.search('Elvis')).to eq([track1])
    end
  end
end
