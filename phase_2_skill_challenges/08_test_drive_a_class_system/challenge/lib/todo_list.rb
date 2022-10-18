# frozen_string_literal: false

require 'todo'

# todolist
class TodoList
  def initialize
    @todo_list = []
  end

  # TODO: is an instance of Todo
  def add(todo)
    # Returns nothing
    @todo_list << todo
  end

  def incomplete
    # Returns all non-done todos
    # [{ task: 'a task to do', complete: false }]
    @todo_list.select { |todo| todo.task[:complete] == false }
  end

  def complete
    # Returns all complete todos
    @todo_list.select { |todo| todo.task[:complete] == true }
  end

  def give_up!
    # Marks all todos as complete
    @todo_list.each(&:mark_done!)
  end
end
