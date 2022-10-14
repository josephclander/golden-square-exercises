def mygcd(x, y)
  smallest = [x, y].min
  divisor = 2
  gcd = 1
  while divisor <= smallest
    divide_both = (x % divisor).zero? && (y % divisor).zero?
    gcd = divisor if divide_both
    divisor += 1
  end
  gcd
end

p mygcd(12, 10)
