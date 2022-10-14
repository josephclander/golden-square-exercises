# frozen_string_literal: false

require 'count_words'

describe 'count_words' do
  it 'returns an integer when given a string' do
    result = count_words('This is a sentence')
    expect(result).to be_a(Integer)
  end

  it 'returns 0 when given an empty string' do
    result = count_words('')
    expect(result).to eq 0
  end

  it 'returns 4 when given "This is a sentence"' do
    result = count_words('This is a sentence')
    expect(result).to eq 4
  end
end
