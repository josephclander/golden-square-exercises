# {{PROBLEM}} Multi-Class Planned Design Recipe

## 1. Describe the Problem

x As a user
So that I can record my experiences
I want to keep a regular diary

x As a user
So that I can reflect on my experiences
I want to read my past diary entries

x As a user
So that I can reflect on my experiences in my busy day
I want to select diary entries to read based on how much time I have and my reading speed

x As a user
So that I can keep track of my tasks
I want to keep a todo list along with my diary

x As a user
So that I can keep track of my contacts
I want to see a list of all of the mobile phone numbers in all my diary entries

TODO word per minute

  reading_time(wpm) 
    should return the amount of time to read an entry at given wpm

  def find_best_entry_for_reading_time(wpm, minutes)
    #words_can_be_read = wpm * minutes
    suitable = {}
    @entries.each do |entry| 
      if entry.reading_time(wpm) <= minutes
        suitable[entry.title] = entry.reading_time(wpm)
      end
    end
    suitable.sort_by{|k,v| v}
    return suitable.to_a[-1][0]



## 2. Design the Class System

_Consider diagramming out the classes and their relationships. Take care to
focus on the details you see as important, not everything. The diagram below
uses asciiflow.com but you could also use excalidraw.com, draw.io, or miro.com_

```
┌─────────────────────────────────────────┐
│                 Diary                   │
│                                         │
│   -storeTodo             -storeEntry    │
│    @task_list             @title        │
│                           @diary_entry  │
│   -add                                  │
│    @task                 -reading_time  │
│                           @wpm          │
│   -read                                 │
│    @task_list            -list_contacts │
│                                         │
│                          -best_entry    │
│                           @time         │
│                           @wpm          │
│                                         │
│                          -read_diary    │
│                           @title        │
│                                         │
└───────┬───────────────────────┬─────────┘
        │                       │
        │                       │
        │                       │
        ▼                       ▼
┌──────────────────┐    ┌─────────────────┐
│      Todo        │    │   DiaryEntry    │
│                  │    │                 │
│   -task          │    │  -contents      │
│    @task         │    │   @title        │
│                  │    │   @contents     │
│                  │    │   @mobile       │
│                  │    │                 │
└──────────────────┘    │  -word_count    │
                        │                 │
                        │                 │
                        └─────────────────┘

```

_Also design the interface of each class in more detail._

```ruby


class Diary
  def initialize
    # initializes with @entries = []
    # initializes with empty array @task_list
  end

  def store_entry(entry) # entry is an instance of DiaryEntry
    # entry gets added to @entries with title as key and entry as value
    # Returns nothing
  end

  def reading_time(wpm, entry)
    # Calculates time to read entry with wpm
  end
  
  def list_contacts
    # List every @mobile
  end

  def read_diary(entry)
    #returns entry.contents
  end
  
  def best_entries(wpm, minutes)
    #returns possible entries that can be read in given time at given speed
  end

  def add_task(task) # task is an instance of Todo
    # adds task to @task_list
  end

  def read_tasks
    # Returns task.task for all tasks in @task_list
  end
end

class DiaryEntry
  def initialize(title, contents, mobile) # title and contents and mobile are both strings
  end

  def contents
    # Returns @contents
  end

  def mobile
    # Returns @mobile
  end
  def title    
  # Returns @title
  end

  def word_count
    # returns word count
  end
end

class Todo
  def initialize(task) # task is a  string
  end

  def task
    # Returns @task
  end
end


```

## 3. Create Examples as Integration Tests

_Create examples of the classes being used together in different situations and
combinations that reflect the ways in which the system will be used._

```ruby
# EXAMPLE

# 1. Store and retrieve diary entry
#DONE
diary = Diary.new
entry1 = DiaryEntry.new("title1", "contents", "07333333333")
diary.store_entry(entry1)
diary.read_diary(entry1) # => "contents"

# 2. Store entries and retrieve based on time
diary = Diary.new
entry1 = DiaryEntry.new("title1", "1 2 3 4 5", "07111111111")
entry2 = DiaryEntry.new("title2", "1 2 3 4 5 6", "07222222222")
diary.store_entry(entry1)
diary.store_entry(entry2)
diary.best_entries(5, 1) # => [entry1]

# 3. Store multiple entries and retrieve based on time
diary = Diary.new
entry1 = DiaryEntry.new("title1", "1 2 3 4 5", "07111111111")
entry2 = DiaryEntry.new("title2", "1 2 3 4 5 6", "07222222222")
entry3 = DiaryEntry.new("title3", "1 2 3 4", "07333333333")
diary.store_entry(entry1)
diary.store_entry(entry2)
diary.store_entry(entry3)
diary.best_entries(5, 1) # => [entry1, entry3]

# 4. Store and list tasks in diary
diary = Diary.new
task1 = Todo.new('task1')
diary.add_task(task1)
diary.read_tasks # => "[task1"]

# 5. Can store diary entries and access a list of the mobile numbers
diary = Diary.new
entry1 = DiaryEntry.new("title1", "1 2 3 4 5", "07111111111")
entry2 = DiaryEntry.new("title2", "1 2 3 4 5 6", "07222222222")
entry3 = DiaryEntry.new("title3", "1 2 3 4", "07333333333")
diary.store_entry(entry1)
diary.store_entry(entry2)
diary.store_entry(entry3)
diary.list_contacts # => ["07111111111", "07222222222", "07333333333"]

```

## 4. Create Examples as Unit Tests

_Create examples, where appropriate, of the behaviour of each relevant class at
a more granular level of detail._

```ruby
# EXAMPLE

# 1. unit testing DiaryEntry
entry1 = DiaryEntry.new("title1", "contents1", "07111111111")
entry1.title # => "title1"
entry1.contents # =>  "contents1"
entry1.mobile # =>  "07111111111"

# 2. can return word count for contents
entry1 = DiaryEntry.new("title1", "1 2 3 4 5", "07111111111")
entry1.word_count # =>  5

```

_Encode each example as a test. You can add to the above list as you go._

## 5. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green,
refactor to implement the behaviour._


