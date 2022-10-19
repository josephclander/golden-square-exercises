class Diary
  def initialize
    @entries = []
    @task_list = []
  end

  def store_entry(entry) 
    @entries << entry
  end
  
  def list_contacts
    # List every @mobile
    contacts_array = @entries.map { |entry| entry.mobile }
    raise "No contacts" if contacts_array == []
    contacts_array
  end

  def read_diary(entry)
    entry.contents
  end
  
  def best_entries(wpm, minutes)
    #returns possible entries that can be read in given time at given speed
   

    max_words = wpm * minutes
    possibilities = @entries.select {|entry| entry.word_count <= max_words }
    
    raise 'No suitable entries' if possibilities.empty?
    possibilities
  end

  # task is an instance of Todo
  def add_task(task)
    @task_list << task
  end

  def read_tasks
    # Returns all tasks in @task_list
    @task_list
  end
end 