# frozen_string_literal: false

require 'grammar_checker'

RSpec.describe 'grammar_checker method' do
  it 'returns FALSE when given an empty string' do
    result = grammar_checker('')
    expect(result).to eq false
  end
  it 'returns FALSE when given a string with no punctuation' do
    result = grammar_checker('Pineapple')
    expect(result).to eq false
  end
  it 'returns FALSE when given a string with punctuation only' do
    result = grammar_checker('mango.')
    expect(result).to eq false
  end
  it 'returns TRUE when given a string with the first word capitalized' do
    result = grammar_checker('Mango.')
    expect(result).to eq true
  end
  it 'returns TRUE when given a string with the first word capitalized' do
    result = grammar_checker('The cat sat on the mat?')
    expect(result).to eq true
  end
end
