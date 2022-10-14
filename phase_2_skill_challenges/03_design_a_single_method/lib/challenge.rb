def todo_finder(text)
  words = text.split(' ') # e.g ['there', 'is', 'a', '#TODO']
  words.include?('#TODO')
end
