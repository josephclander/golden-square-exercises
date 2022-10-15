# File: exercise.rb
def factorial(n)
  product = 1
  while n > 0
    # binding.irb # Mystery new line!
    product *= n
    n -= 1
  end
  product
end

p factorial(5)

# cd into folder and run: ruby exercise.rb

# you will now get a mini irb terminal in vs code

# type a value and enter to access its current value

# you can put `binding.irb` in multiple places
