# frozen_string_literal: false

require 'challenge'

describe LetterCounter do
  context 'no input' do
    it 'returns [0, "none"]' do
      counter = LetterCounter.new('')
      result = counter.calculate_most_common
      expect(result).to eq([0, 'none'])
    end
  end

  context 'no valid input' do
    it 'returns [0, "none"]' do
      counter = LetterCounter.new('£$%^&*___')
      result = counter.calculate_most_common
      expect(result).to eq([0, 'none'])
    end
  end

  context 'input "Digital Punk"' do
    it 'returns [2,"i"]' do
      counter = LetterCounter.new('Digital Punk')
      result = counter.calculate_most_common
      expect(result).to eq([2, 'i'])
    end
  end

  context 'input "£9ghghghghhhhhhh"' do
    it 'returns [10,"h"]' do
      counter = LetterCounter.new('£9ghghghghhhhhhh')
      result = counter.calculate_most_common
      expect(result).to eq([10, 'h'])
    end
  end
end
