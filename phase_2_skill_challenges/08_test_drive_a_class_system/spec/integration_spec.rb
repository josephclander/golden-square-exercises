# frozen_string_literal: false

require 'diary'
require 'diary_entry'

describe 'Diary Integration' do
  context 'after adding some entries' do
    it 'gets all diary entries' do
      diary = Diary.new
      entry_1 = DiaryEntry.new('title_01', 'contents_01 ' * 1600)
      entry_2 = DiaryEntry.new('title_02', 'contents_02 ' * 900)
      diary.add(entry_1)
      diary.add(entry_2)
      expect(diary.all).to eq([entry_1, entry_2])
    end
  end
  # removed the `#method` setup as it's an integration test
  # and they don't test that individually
  describe 'word counting behaviour' do
    it 'counts the words in all diary entries' do
      diary = Diary.new
      entry_1 = DiaryEntry.new('title_01', 'contents_01 ' * 1600)
      entry_2 = DiaryEntry.new('title_02', 'contents_02 ' * 900)
      diary.add(entry_1)
      diary.add(entry_2)
      expect(diary.count_words).to eq(2500)
    end
  end

  describe 'reading time behaviour' do
    it 'fails where wpm is 0' do
      diary = Diary.new
      entry_1 = DiaryEntry.new('title_01', 'contents_01 ' * 1600)
      entry_2 = DiaryEntry.new('title_02', 'contents_02 ' * 900)
      diary.add(entry_1)
      diary.add(entry_2)
      expect { diary.reading_time(0) }.to raise_error 'wpm must be positive'
    end

    it 'returns total reading time of all entries' do
      diary = Diary.new
      entry_1 = DiaryEntry.new('title_01', 'contents_01 ' * 1600)
      entry_2 = DiaryEntry.new('title_02', 'contents_02 ' * 900)
      diary.add(entry_1)
      diary.add(entry_2)
      expect(diary.reading_time(250)).to eq(9) # => (3.6 + 6.4) is 3 + 6
    end
  end

  describe 'find_best_entry_for_reading_time' do
    context 'wpm is zero' do
      it 'fails' do
        diary = Diary.new
        entry_1 = DiaryEntry.new('title_01', 'contents_01 ' * 600)
        diary.add(entry_1)
        expect { diary.find_best_entry_for_reading_time(0, 5)}.to raise_error 'wpm must be positive'
      end
    end

    context 'one item readable in the time' do
      it 'returns that entry' do
        diary = Diary.new
        entry_1 = DiaryEntry.new('title_01', 'contents_01 ' * 600)
        diary.add(entry_1)
        expect(diary.find_best_entry_for_reading_time(250, 5)).to eq(entry_1)
      end
    end
    context 'one item unreadable in the time' do
      it 'returns nil' do
        diary = Diary.new
        entry_1 = DiaryEntry.new('title_01', 'contents_01 ' * 1600)
        diary.add(entry_1)
        expect(diary.find_best_entry_for_reading_time(250, 5)).to eq(nil)
      end
    end
    context 'multiple entries' do
      it 'returns closest match' do
        diary = Diary.new
        best_title = DiaryEntry.new('title', 'one two ' * 1000)
        entry_1 = DiaryEntry.new('title', 'one ' * 1000)
        entry_2 = best_title
        entry_3 = DiaryEntry.new('title', 'one two three ' * 1000)
        diary.add(entry_1)
        diary.add(entry_2)
        diary.add(entry_3)
        expect(diary.find_best_entry_for_reading_time(250, 11)).to eq(entry_2)
      end
    end
  end
end
