# frozen_string_literal: false

# add contents to diary
class DiaryEntry
  # title, contents are strings
  def initialize(title, contents)
    @title = title
    @contents = contents
    @chunk_count = 0
  end

  attr_reader :title, :contents
  attr_accessor :counter

  def count_words
    # Returns the number of words in the contents as an integer
    @contents.split.length
  end

  def reading_time(wpm)
    # wpm is an integer representing the number of words the
    # user can read per minute
    # Returns an integer representing an estimate of the reading time in minutes
    # for the contents at the given wpm.
    word_count = @contents.split.length
    word_count / wpm
  end

  def reading_chunk(wpm, minutes)
    # `wpm` is an integer representing the number
    # of words the user can read per minute
    # `minutes` is an integer representing the
    # number of minutes the user has to read
    # Returns a string with a chunk of the contents that the user could read
    # in the given number of minutes.
    # If called again, `reading_chunk` should return the next chunk, skipping
    # what has already been read, until the contents is fully read.
    # The next call after that it should restart from the beginning.
    new_chunk_length = wpm * minutes
    new_chunk = @contents[@chunk_count...(@chunk_count + new_chunk_length)]
    @chunk_count += new_chunk_length
    new_chunk
  end
end
