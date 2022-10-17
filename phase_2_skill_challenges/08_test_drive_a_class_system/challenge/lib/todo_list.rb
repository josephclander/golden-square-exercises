# frozen_string_literal: false

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
    @todo_list
  end

  def complete
    # Returns all complete todos
  end

  def give_up!
    # Marks all todos as complete
  end
end
