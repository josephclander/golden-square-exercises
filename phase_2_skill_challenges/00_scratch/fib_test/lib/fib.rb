# frozen_string_literal: false

def fib(number)
  # base case
  return 1 if number <= 2

  fib(number - 1) + fib(number - 2)
end
