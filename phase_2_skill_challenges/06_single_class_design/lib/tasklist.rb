# frozen_string_literal: false

# a user can add, remove and list their tasks
class TaskList
  def initialize
    # an empty task_list []
    @task_list = []
  end

  # task is a string
  def add(task)
    # no return value
    @task_list << task
  end

  def list
    # returns a list of tasks as a string numbered and separated by commas
    return '0 tasks' if @task_list.empty?

    @task_list.each_with_index.map { |task, index| "#{index + 1}. #{task}" }.join(', ')
  end

  # task_number is a positive integer from the list
  def complete(task_number)
    # if the task_number doesn't exist, return "0 tasks"
    raise 'No such task' unless task_number.is_a?(Integer) && @task_list[task_number - 1]

    # return '0 tasks' unless task_number.is_a?(Integer) && @task_list[task_number - 1]

    # removes task from list
    # returns the new task_list
    @task_list.delete_at(task_number - 1)
    list
  end
end
