# frozen_string_literal: false

# music library class to hold tracks, add and list them
class MusicLibrary
  def initialize
    @music_library = []
  end

  def add(track)
    raise 'must be text' unless track.is_a?(String)

    @music_library << track
  end

  def list
    @music_library
  end
end
