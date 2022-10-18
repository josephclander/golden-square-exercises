# frozen_string_literal: false

require 'track'

describe Track do
  it 'returns true when title or artist matches' do
    track = Track.new('title', 'artist')
    result = track.matches?('ti')
    expect(result).to be true
    result = track.matches?('art')
    expect(result).to be true
  end

  it 'returns false when neither title or artist matches' do
    track = Track.new('title', 'artist')
    result = track.matches?('artisg')
    expect(result).to be false
  end

  it 'returns true when matches empty' do
    track = Track.new('title', 'artist')
    result = track.matches?('')
    expect(result).to be true
  end
end
