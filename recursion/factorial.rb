def factorial_iterative(num)
  product = 1
  while num > 0
    product = product * num
    num -= 1
  end
  product
end

# puts factorial_iterative(20)

def factorial_recursive(num)
  # product = 1
  # num <= 1 ? product : product = product * num * factorial_recursive(num-1)
  num * ((num > 1) ? factorial_recursive(num-1) : 1)
end


puts factorial_recursive(20)
