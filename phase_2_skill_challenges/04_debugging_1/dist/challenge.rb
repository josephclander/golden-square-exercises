# frozen_string_literal: false

def get_most_common_letter(text)
  # TODO: It includes characters as well as letters
  # TODO: It sorts from min to max so want last term
  counter = Hash.new(0)
  letters_only = text.chars.select { |character| ('a'..'z').to_a.include?(character) }
  letters_only.each do |char|
    counter[char] += 1
  end
  # TAKE YOUR PICK -> EACH WILL WORK
  # counter.sort_by { |_k, v| v }[-1][0]
  # counter.sort_by { |_k, v| -v }[0][0]
  # recommended by rubocop
  counter.to_a.max_by { |_k, v| v }[0][0]
end

p get_most_common_letter('the roof, the roof, the roof is on fire!')
# => "o"
