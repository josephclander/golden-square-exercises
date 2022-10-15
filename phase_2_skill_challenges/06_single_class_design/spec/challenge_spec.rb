# frozen_string_literal: false

require 'challenge'

describe MusicLibrary do
  before :each do
    @music_library = MusicLibrary.new
  end

  context 'no items added' do
    it 'returns blank list of tracks' do
      expect(@music_library.list).to eq([])
    end
  end

  context 'one item added' do
    it 'returns list with 1 track' do
      @music_library.add('Ruby Ruby Ruby')
      expect(@music_library.list).to eq(['Ruby Ruby Ruby'])
    end
  end

  context 'two items added' do
    it 'returns list with 2 tracks' do
      @music_library.add('Ruby Ruby Ruby')
      @music_library.add('This will do!')
      expect(@music_library.list).to eq(['Ruby Ruby Ruby', 'This will do!'])
    end
  end

  context 'invalid input' do
    it 'returns error msg "must be text"' do
      expect { @music_library.add(1) }.to raise_error 'must be text'
    end
  end
end
