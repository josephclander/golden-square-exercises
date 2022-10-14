def mygcd(x, y)
  return 1 if x == 1 || y == 1

  smallest = [x, y].min
  largest = [x, y].max
  remainder = largest % smallest
  if remainder.zero?
    smallest
  else
    mygcd(smallest, remainder)
  end
end
