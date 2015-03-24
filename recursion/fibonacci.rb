require 'pry'
def fibonacci_iterative(num)
  a = 1
  b = 1

  while num > 1
    a, b = b, a+b
    num -= 1
  end
  a
end

puts fibonacci_iterative(7)


def fibonacci_recursive(n, a=1, b=1)
 n > 1 ? fibonacci_recursive(n-1, b, a+b) : a
end



p fibonacci_recursive(7)