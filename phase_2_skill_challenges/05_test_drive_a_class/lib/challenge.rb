# frozen_string_literal: false

# grammar stats
class GrammarStats
  def initialize
    @text_count = 0
    @win_count = 0
  end

  # text is a string
  def check(text)
    # Returns true or false depending on whether the text begins with a capital
    # letter and ends with a sentence-ending punctuation mark.
    @text_count += 1
    return false if text == ''

    if text[0].upcase == text[0] && %w[. ! ?].include?(text[-1])
      @win_count += 1
      true
    else
      false
    end
  end

  def percentage_good
    # Returns as an integer the percentage of texts checked so far that passed
    # the check defined in the `check` method. The number 55 represents 55%.
    ((@win_count / @text_count.to_f) * 100).round
  end
end
