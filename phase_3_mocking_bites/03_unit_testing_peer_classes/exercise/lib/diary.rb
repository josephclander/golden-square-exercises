# frozen_string_literal: false

# File: lib/diary.rb
class Diary
  def initialize(contents)
    @contents = contents
  end

  # Returns the contents of the diary
  def read
    @contents
  end
end
