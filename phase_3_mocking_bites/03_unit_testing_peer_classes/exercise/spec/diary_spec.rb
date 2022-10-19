# frozen_string_literal: false

require 'diary'

describe Diary do
  it 'constructs' do
    diary = Diary.new('The contents of my diary')
    result = diary.read
    expect(result).to eq('The contents of my diary')
  end
end
