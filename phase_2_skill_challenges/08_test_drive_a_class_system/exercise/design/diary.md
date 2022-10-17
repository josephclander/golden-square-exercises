# Diary Design Method

## Example Tests

```ruby

# 1. gets all diary entries
diary = Diary.new
entry_1 = DiaryEntry.new('title_01', 'contents_01 '*1600)
entry_2 = DiaryEntry.new('title_02', 'contents_02 '*900)
diary.add(entry_1)
diary.add(entry_2)
diary.all # => [entry_1, entry_2]

# 2. counts content words from all entries
diary.Diary.new
entry_1 = DiaryEntry.new('title_01', 'contents_01 '*1600)
entry_2 = DiaryEntry.new('title_02', 'contents_02 '*900)
diary.add(entry_1)
diary.add(entry_2)
# method has to call diaryEntry.count_words
diary.count_words # => 2500

# 3. returns time to read all diary entries
diary.Diary.new
entry_1 = DiaryEntry.new('title_01', 'contents_01 '*1600)
entry_2 = DiaryEntry.new('title_02', 'contents_02 '*900)
diary.add(entry_1)
diary.add(entry_2)
diary.reading_time(250) # => 10 (2500 / 250) [s = d / t]

# 4. returns closest entry less than their reading time
diary.Diary.new
entry_1 = DiaryEntry.new('title_01', 'contents_01 '*1600)
entry_2 = DiaryEntry.new('title_02', 'contents_02 '*900)
diary.add(entry_1)
diary.add(entry_2)
# entry_1 takes 3.6 mins entry_2 takes 6.4 mins
diary.find_best_entry_for_reading_time(250, 5) # => contents of entry_2

```
