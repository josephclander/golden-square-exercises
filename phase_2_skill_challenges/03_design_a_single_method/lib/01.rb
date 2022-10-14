# frozen_string_literal: false

def reading_time(text)
  words_array = text.split(' ')
  word_length = words_array.length
  word_length / 200
end
