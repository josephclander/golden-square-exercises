def grammar_checker(string)
  last_char = string[-1]
  first_char = string[0]
  %w[. ! ?].include?(last_char) && first_char.upcase == first_char
end