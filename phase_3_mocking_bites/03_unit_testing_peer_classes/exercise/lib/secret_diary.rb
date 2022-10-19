# frozen_string_literal: false

# File: lib/secret_diary.rb
class SecretDiary
  # diary is an instance of Diary
  def initialize(diary)
    @diary = diary
    @locked = true
  end

  # Raises the error "Go away!" if the diary is locked
  # Returns the diary's contents if the diary is unlocked
  # The diary starts off locked
  def read
    raise 'Go away!' if @locked

    @diary.read
  end

  # Locks the diary
  # Returns nothing
  def lock
    @locked = true
  end

  # Unlocks the diary
  # Returns nothing
  def unlock
    @locked = false
  end
end
