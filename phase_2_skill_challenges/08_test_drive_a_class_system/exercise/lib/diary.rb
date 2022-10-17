# frozen_string_literal: false

require 'diary_entry'
# File: lib/diary.rb
class Diary
  def initialize
    @diary = []
  end

  # entry is an instance of DiaryEntry
  def add(entry)
    # Returns nothing
    @diary << entry
  end

  def all
    # Returns a list of instances of DiaryEntry
    @diary
  end

  def count_words
    # Returns the number of words in all diary entries
    # HINT: This method should make use of the `count_words` method on DiaryEntry.
    @diary.sum(&:count_words)
    # @diary.map(&:count_words).sum
    # @diary.inject(0) { |sum, entry| sum + entry.count_words }
  end

  # wpm is an integer representing
  def reading_time(wpm)
    # the number of words the user can read per minute
    # Returns an integer representing an estimate of the reading time in minutes
    # if the user were to read all entries in the diary.
    raise 'wpm must be positive' unless wpm.positive?

    # doesn't work
    # @entries.sum do |entry|
    #   entry.reading_time(wpm)
    # end
    # count_words / wpm # - this comes down to your stance on rounding
    @diary.inject(0) { |sum, entry| sum + entry.reading_time(wpm) }
  end

  def find_best_entry_for_reading_time(wpm, minutes)
    # `wpm` is an integer representing the number of words the user can read
    # per minute.
    # `minutes` is an integer representing the number of minutes the user
    # has to read.
    # Returns an instance of diary entry representing the entry that is closest
    # to, but not over, the length that the user could read in the minutes they
    # have available given their reading speed
    possible_options = @diary.select do |entry|
      entry.reading_time(wpm) <= minutes
    end
    possible_options.max_by { |entry| entry.contents.length }
  end
end
