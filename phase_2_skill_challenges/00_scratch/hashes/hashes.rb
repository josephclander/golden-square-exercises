# frozen_string_literal: false

require_relative './helper'

# examples

# 1. adding to hashes
# hash01 = {
#   'joe' => 42,
#   'ellie' => 34
# }

# hash01['grant'] = 25
# hash01['grant'] = 32
# print_hash(hash01)

# 2. incrementing values in hashes
# hash02 = {
#   'a' => 0,
#   'b' => 0,
#   'c' => 0
# }

# hash02['a'] += 1
# hash02['a'] += 1
# hash02['b'] += 1
# hash02['c'] += 5

# access key value
# print_one(hash02['c'])
# print_hash(hash02)

# 3. hash specific key?
# hash03 = {
#   'Maths' => 4,
#   'English' => 12,
#   'Science' => 8
# }

# check_specific_key = hash03.key?('a')
# check_specific_key = hash03.select { |key, _value| key == 'English' }
# check_specific_key = hash03.fetch('Maths', "Nope we don't like Maths")
# check_specific_key = hash03.fetch('IT', "Nope we don't like IT")

# print_hash(hash03)
# print_one(check_specific_key)

# list = hash03.keys
# list = hash03.values
# print_hash(hash03)
# print_hash(list)

# 4. iterate over hash
# hash04 = {
#   'Maths' => 4,
#   'English' => 12,
#   'Science' => 8
# }

# hash04.each { |key, _value| hash04[key] += 2 }
# print_hash(hash04)

# output = hash04.map { |key, value| "Subject: #{key}, Teachers: #{value}" }
# print_one(output)

# 5. hash pattern to count
# hash05 = {}

# letter_list = %w[a b a a b a b a a a c c c d]
# letter_list.each { |letter| hash05[letter] += 1 }
# letter_list.each do |letter|
#   if hash05[letter]
#     hash05[letter] += 1
#   else
#     hash05[letter] = 1
#   end
# end
# print_hash(hash05)

# largest_value = hash05.max_by { |_key, value| value }
# print_one(largest_value)
