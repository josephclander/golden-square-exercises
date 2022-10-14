## Example Tests

```ruby
# 01: test #title
entry = DiaryEntry.new('Monday', 'lots of words ' * 300)
entry.title = 'Monday'

# 02: test #contents
entry = DiaryEntry.new('Monday', 'lots of words ' * 300)
entry.contents => 'lots of words' * 300

# 03: test #count_words
entry = DiaryEntry.new('Monday', 'lots of words ' * 300)
entry.count_words => 900

# 04: test #reading_time
entry = DiaryEntry.new('Monday', 'lots of words ' * 300)
# 250 wpm is an average speed for reading
# time = words / speed
# I am taking the stance that you round down
# e.g. 900 / 150 = 3.6 => 3
entry.reading_time(250) => 3

# 05: test #reading_chunk returns correct chunk on first call
#TODO includes punctuation and spaces?
entry = DiaryEntry.new('Monday', 'lots of words ' * 500)
# words = time * speed
# words = 1 * 250 = 250
entry.reading_chunk(250, 1) => words[0...250]

# 06: test #reading_chunk returns correct chunk on second call
#TODO includes punctuation and spaces?
entry = DiaryEntry.new('Monday', 'lots of words ' * 500)
# words = time * speed
# for simplicity keeping the wpm the same
# words = 2 * 250 = 500
entry.reading_chunk(250, 2) => words[250...750]

# 07: test #reading_chunk returns correct chunk on third call - that goes back to start
#TODO includes punctuation and spaces?
entry = DiaryEntry.new('Monday', 'lots of words ' * 500)
# words = time * speed
# for simplicity keeping the wpm the same
# words = 4 * 250 = 1000
entry.reading_chunk(250, 4) => words[750...1750]
```
