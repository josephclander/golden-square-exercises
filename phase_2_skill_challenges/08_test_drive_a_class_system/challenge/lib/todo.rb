# frozen_string_literal: false

# single todo
class Todo
  # task is a string
  def initialize(task)
    @task = { note: task, complete: false }
  end

  attr_reader :task

  def mark_done!
    # Marks the todo as done
    # Returns nothing
    @task[:complete] = true
  end

  def done?
    # Returns true if the task is done
    # Otherwise, false
  end
end
