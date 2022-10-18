# frozen_string_literal: false

# File: lib/track.rb
class Track
  # title and artist are both strings
  def initialize(title, artist)
    @title = title
    @artist = artist
  end

  # keyword is a string
  # Returns true if the keyword matches either the title or artist
  def matches?(keyword)
    @title.include?(keyword) || @artist.include?(keyword)
  end
end
