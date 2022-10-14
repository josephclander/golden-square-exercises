# frozen_string_literal: false

# takes a string as an argument and returns the number of words in that string.
def count_words(sentence)
  word_array = sentence.split(' ')
  word_array.length
end
