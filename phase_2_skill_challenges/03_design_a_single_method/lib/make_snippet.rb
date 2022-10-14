# frozen_string_literal: false

# takes a string as an argument and returns the first five words and then a '...' if there are more than that.
def make_snippet(sentence)
  words_array = sentence.split(' ')
  up_to_5_words = words_array[0, 5].join(' ')
  up_to_5_words << '...' if words_array.length > 5
  up_to_5_words
end
