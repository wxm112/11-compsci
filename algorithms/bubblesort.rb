def bubble_sort(elements)
  n = elements.length - 2 # The maximum index we'll initially consider.

  # Iterate repeatedly, ignoring one more element at the end each time, i.e.:
  # (1..9)
  # (1..8)
  # (1..7) ...
  n.downto(1) do |terminator|

    # Swap any unsorted elements between 0 and the current "end".
    for i in (0..terminator) do
      if (elements[i] > elements[i + 1])
        elements[i], elements[i + 1] = elements[i + 1], elements[i] # Swap
      end
    end

  end

  elements
end


# Gnerate a randomly shuffled array.
a = (1..100).to_a.shuffle


p a # Show the unsorted array
p bubble_sort(a) # Show the sorted array