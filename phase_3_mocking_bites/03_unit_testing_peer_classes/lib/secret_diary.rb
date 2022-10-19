# frozen_string_literal: false

# File: lib/secret_diary.rb
class SecretDiary
  def initialize(diary) # diary is an instance of Diary
    # ...
  end

  def read
    # Raises the error "Go away!" if the diary is locked
    # Returns the diary's contents if the diary is unlocked
    # The diary starts off locked
  end

  def lock
    # Locks the diary
    # Returns nothing
  end

  def unlock
    # Unlocks the diary
    # Returns nothing
  end
end