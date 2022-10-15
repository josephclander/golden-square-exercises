# {TaskList} Class Design Recipe

## 1. Describe the Problem

> As a user
> So that I can keep track of my tasks
> I want a program that I can add todo tasks to and see a list of them.

> As a user
> So that I can focus on tasks to complete
> want to mark tasks as complete and have them disappear from the list.

## 2. Design the Class Interface

_Include the initializer and public methods with all parameters and return values._

```ruby
# EXAMPLES

class TaskList
  def initialize
    # an empty task_list []
  end

  def add(task) # task is a string
    # return 'must be a string' if task isn't a string
    # otherwise, no return value
  end

  def list
    # returns a list of tasks as a string numbered and separated by commas
  end

  def complete(task_number) # task_number is a positive integer from the list
    # if the task_number doesn't exist, return "no such task"
    # removes task from list
    # returns the new task_list
  end
end
```

## 3. Create Examples as Tests

_Make a list of examples of how the class will behave in different situations._

```ruby
# EXAMPLE

# 1
tasks = TaskList.new
tasks.list # => '0 tasks'

# 2
tasks = TaskList.new
tasks.add('Wash clothes')
tasks.list # => '1. Wash clothes'

# 3
tasks = TaskList.new
tasks.add('Wash clothes')
tasks.add('Paint the shed')
tasks.list # => '1. Wash clothes, 2. Paint the shed'

# 4
tasks = TaskList.new
tasks.complete(1) # => '0 tasks'

# 5
tasks = TaskList.new
tasks.add('Wash clothes')
tasks.complete(2) # => '0 tasks'

# 6
tasks = TaskList.new
tasks.add('Wash clothes')
tasks.complete(1) # => '0 tasks'

# 7
tasks = TaskList.new
tasks.add('Wash clothes')
tasks.add('Paint the shed')
tasks.complete(1) # => '1. Paint the shed'

# 8 input not an integer
tasks = TaskList.new
tasks.add('Wash clothes')
tasks.add('Paint the shed')
tasks.complete('1') # => '0 tasks'

```

_Encode each example as a test. You can add to the above list as you go._

## 4. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._
