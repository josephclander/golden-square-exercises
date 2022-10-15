# frozen_string_literal: false

# TODO

# to count letters
class LetterCounter
  def initialize(text)
    @text = text
  end

  def calculate_most_common
    # shouldn't start with default of 1
    counter = Hash.new(0)
    most_common = 'none'
    most_common_count = 0
    # made all lowercase
    @text.downcase.chars.each do |char|
      # next will make it skip if a char isn't a letter
      next unless letter?(char)

      counter[char] += 1
      # TODO: so this will only update if it is bigger, doesn't change for equal
      next unless counter[char] > most_common_count

      most_common = char
      # TODO
      # this was adding cumulatively to the most_common_count
      # most_common_count += counter[char]
      most_common_count = counter[char]
    end
    [most_common_count, most_common]
  end

  private

  # regex is this a letter
  # TODO make lowercase? - done above
  def letter?(letter)
    letter =~ /[a-z]/i
  end
end
