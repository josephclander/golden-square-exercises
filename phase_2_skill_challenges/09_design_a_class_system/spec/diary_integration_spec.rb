require "diary"
require "todo"
require "diary_entry"

RSpec.describe "Integration" do
  context "storage and retrieval of diary entries" do
    it "can store and retrieve a single entry" do
      diary = Diary.new
      entry1 = DiaryEntry.new("title1", "contents", "07333333333")
      diary.store_entry(entry1)
      expect(diary.read_diary(entry1)).to eq "contents"
    end
    it "can store and retrieve multiple entries" do
      diary = Diary.new
      entry1 = DiaryEntry.new("title1", "contents1", "07333333333")
      entry2 = DiaryEntry.new("title2", "contents2", "07333333333")
      diary.store_entry(entry1)
      diary.store_entry(entry2)
      expect(diary.read_diary(entry2)).to eq "contents2"
      expect(diary.read_diary(entry1)).to eq "contents1"
    end
  end

  context "storage and retrieval based on time" do
    it "fails when no possible entry" do
      diary = Diary.new
      entry1 = DiaryEntry.new("title1", "1 2 3 4 5", "07111111111")
      diary.store_entry(entry1)
      expect {diary.best_entries(3, 1)}.to raise_error 'No suitable entries'
    end
    it "fails when wpm is zero" do
      diary = Diary.new
      entry1 = DiaryEntry.new("title1", "1 2 3 4 5", "07111111111")
      diary.store_entry(entry1)
      expect {diary.best_entries(0, 1)}.to raise_error 'No suitable entries'
    end
    it 'can retrieve best entry when only one possible entry' do
      diary = Diary.new
      entry1 = DiaryEntry.new("title1", "1 2 3 4 5", "07111111111")
      entry2 = DiaryEntry.new("title2", "1 2 3 4 5 6", "07222222222")
      diary.store_entry(entry1)
      diary.store_entry(entry2)
      expect(diary.best_entries(5, 1)).to eq([entry1])
    end
    it 'can retrieve best entry when multiple possible entries' do
      diary = Diary.new
      entry1 = DiaryEntry.new("title1", "1 2 3 4 5", "07111111111")
      entry2 = DiaryEntry.new("title2", "1 2 3 4 5 6", "07222222222")
      entry3 = DiaryEntry.new("title3", "1 2 3 4", "07333333333")
      diary.store_entry(entry1)
      diary.store_entry(entry2)
      diary.store_entry(entry3)
      expect(diary.best_entries(5, 1)).to eq [entry1, entry3]
    end
  end
  context "storage and retrieval of todo list" do
    it "can store and list one task" do
      diary = Diary.new
      task1 = Todo.new('task1')
      diary.add_task(task1)
      expect(diary.read_tasks).to eq [task1]
    end
    
    it "can store and list multiple tasks" do
      diary = Diary.new
      task1 = Todo.new('task1')
      task2 = Todo.new('task2')
      diary.add_task(task1)
      diary.add_task(task2)
      expect(diary.read_tasks).to eq [task1, task2]
    end
  end
  context "can return all mobile numbers" do
    it 'returns 0 of 0 mobiles' do
      diary = Diary.new
      expect {diary.list_contacts}.to raise_error "No contacts"
    end

    it 'returns 1 of 1 mobiles' do
      diary = Diary.new
      entry1 = DiaryEntry.new("title1", "1 2 3 4 5", "07111111111")
      diary.store_entry(entry1)
      expect(diary.list_contacts).to eq ["07111111111"]
    end
    
    it 'returns 2 of 2 mobiles' do
      diary = Diary.new
      entry1 = DiaryEntry.new("title1", "1 2 3 4 5", "07111111111")
      entry2 = DiaryEntry.new("title2", "1 2 3 4 5 6", "07222222222")
      diary.store_entry(entry1)
      diary.store_entry(entry2)
      expect(diary.list_contacts).to eq ["07111111111", "07222222222"]
    end
  end
end