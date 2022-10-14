# frozen_string_literal: false

require '01'

describe 'reading_time' do
  context 'when an empty string' do
    it 'returns 0' do
      result = reading_time('')
      expect(result).to eq 0
    end
  end
  context 'when text has 1200 words' do
    it 'returns 6' do
      result = reading_time('WORD ' * 1200)
      expect(result).to eq 6
    end
  end
  context 'when text has 1250 words' do
    it 'returns 6' do
      result = reading_time('WORD ' * 1250)
      expect(result).to eq 6
    end
  end
end
