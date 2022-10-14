# frozen_string_literal: false

# convert a given integer into a roman numeral string
class Roman
  VALUES = {
    100 => 'C',
    90 => 'XC',
    50 => 'L',
    40 => 'XL',
    10 => 'X',
    9 => 'IX',
    5 => 'V',
    4 => 'IV',
    1 => 'I'
  }.freeze

  def convert(number)
    string = ''
    VALUES.each do |key, value|
      while number >= key
        string << value
        number -= key
      end
    end
    string
  end
end
