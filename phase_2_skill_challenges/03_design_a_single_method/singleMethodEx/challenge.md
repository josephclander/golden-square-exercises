## 1. Describe the Problem

As a user
So that I can keep track of my tasks
I want to check if a text includes the string #TODO.

## 2. Design the Method Signature

```
`todo_finder(text)` takes a string to find '#TODO'
`include_TODO = todo_finder(text)` returns whether TODO exists

`text` = string
`include_TODO` = returns boolean

```

## 3. Create Examples as Tests

_Make a list of examples of what the method will take and return._

```ruby
todo_finder('') = false
todo_finder('none') = false
todo_finder('#TODO') = true
todo_finder('there is no todo') = false
todo_finder('there is a #TODO') = true




```

_Encode each example as a test. You can add to the above list as you go._

## 4. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._
