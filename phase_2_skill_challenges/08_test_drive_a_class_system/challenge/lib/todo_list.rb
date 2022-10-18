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
    @todo_list.reject(&:done?)
  end

  def complete
    # Returns all complete todos
    @todo_list.select(&:done?)
  end

  def give_up!
    # Marks all todos as complete
    @todo_list.each(&:mark_done!)
  end
end
