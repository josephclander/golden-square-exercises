# frozen_string_literal: false

# File: lib/diary_entry.rb
class DiaryEntry
  attr_reader :title, :contents

  # title, contents are strings
  def initialize(title, contents)
    @title = title
    @contents = contents
  end

  def count_words
    # Returns the number of words in the contents as an integer
    @contents.split.length
  end

  # wpm is an integer representing
  def reading_time(wpm)
    # the number of words the user can read per minute
    # Returns an integer representing an estimate of the reading time in minutes
    # for the contents at the given wpm.
    raise 'wpm must be positive' unless wpm.positive?

    count_words / wpm
  end

  # `wpm` is an integer representing the number
  def reading_chunk(wpm, minutes)
    # of words the user can read per minute
    # `minutes` is an integer representing the
    # number of minutes the user has to read
    # Returns a string with a chunk of the contents that the user could read
    # in the given number of minutes.
    # If called again, `reading_chunk` should return the next chunk, skipping
    # what has already been read, until the contents is fully read.
    # The next call after that it should restart from the beginning.
  end
end
