# frozen_string_literal: false

require 'make_snippet'

describe 'make_snippet' do
  context 'setup basics' do
    it 'returns a string when given a string' do
      result = make_snippet('A long sentence')
      expect(result).to be_a(String)
    end
  end

  context 'simple passing features' do
    # NOTE: will a full stop get counted as a word or ignored?
    it 'returns the same string if there are 5 or fewer words' do
      result = make_snippet('There are four words')
      expect(result).to eq 'There are four words'
    end

    it 'returns 5 words from string and ellipsis if 6 words' do
      result = make_snippet('This sentence will contain six words')
      expect(result).to eq 'This sentence will contain six...'
    end
  end
end
