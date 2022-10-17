# frozen_string_literal: false

require 'diary_entry'

describe DiaryEntry do
  it 'constructs' do
    entry = DiaryEntry.new('title_01', 'contents_01 ' * 1600)
    expect(entry.title).to eq('title_01')
    expect(entry.contents).to eq('contents_01 ' * 1600)
  end

  describe '#count_words' do
    context 'no contents in diary entry' do
      it 'returns zero' do
        entry = DiaryEntry.new('title_01', '')
        expect(entry.count_words).to eq(0)
      end
    end
    context 'no contents in diary entry' do
      it 'returns zero' do
        entry = DiaryEntry.new('title_01', 'contents_01 ' * 1600)
        expect(entry.count_words).to eq(1600)
      end
    end
    context 'when entries have been added' do
      it 'counts the words in the entry' do
        entry = DiaryEntry.new('title_01', 'contents_01 ' * 1600)
        expect(entry.count_words).to eq(1600)
      end
    end
  end

  describe '#reading_time' do
    context 'wpm is zero' do
      it 'fails' do
        entry = DiaryEntry.new('title_01', 'contents_01 ' * 1600)
        expect { entry.reading_time(0) }.to raise_error 'wpm must be positive'
      end
    end
    context 'no contents in diary entry' do
      it 'returns zero' do
        entry = DiaryEntry.new('title_01', '')
        expect(entry.reading_time(250)).to eq(0)
      end
    end
    context 'when entries have been added' do
      it 'counts the words in the entry' do
        entry = DiaryEntry.new('title_01', 'contents_01 ' * 1600)
        expect(entry.reading_time(250)).to eq(6)
      end
    end
  end
end
