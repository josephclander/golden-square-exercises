# frozen_string_literal: false

# File: lib/music_library.rb
class MusicLibrary
  def initialize
    @library = []
  end

  # track is an instance of Track
  # Track gets added to the library
  # Returns nothing
  def add(track)
    @library << track
  end

  # Returns a list of track objects
  def all
    @library
  end

  # keyword is a string
  # Returns a list of tracks that match the keyword
  def search(keyword)
    @library.select { |track| track.matches?(keyword) }
  end
end
