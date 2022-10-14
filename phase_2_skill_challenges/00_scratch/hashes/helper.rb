# frozen_string_literal: false

require 'json'

# add colours to String class
class String
  def red
    "\e[31m#{self}\e[0m"
  end

  def green
    "\e[32m#{self}\e[0m"
  end
end

def print_hash(hash)
  puts 'hash ='.red
  puts JSON.pretty_generate(hash).green
end

def print_one(input)
  puts 'output ='.red
  puts JSON.pretty_generate(input).green
end
