# frozen_string_literal: false

# task formatter addition
class TaskFormatter
  # task is an instance of Task
  def initialize(task)
    @task = task
  end

  # Returns the task formatted as a string.
  # If the task is not complete, the format is:
  # - [ ] Task title
  # If the task is complete, the format is:
  # - [x] Task title
  def format
    check = @task.complete? ? 'x' : ' '
    "- [#{check}] #{@task.title}"
  end
end
