require "diary_entry"

RSpec.describe DiaryEntry do
  it "can initialize and return its parameters" do
    entry1 = DiaryEntry.new("title1", "contents1", "07111111111")
    expect(entry1.title).to eq "title1"
    expect(entry1.contents).to eq "contents1"
    expect(entry1.mobile).to eq "07111111111"
  end
  it "can return word count for contents" do
    entry1 = DiaryEntry.new("title1", "1 2 3 4 5", "07111111111")
    expect(entry1.word_count).to eq 5
  end
  #it "can return reading time given wpm" do
  #  entry1 = DiaryEntry.new("title1", "1 2 3 4 5", "07111111111")
  #  expect(entry1.reading_time(5)).to eq 1
  #end
end