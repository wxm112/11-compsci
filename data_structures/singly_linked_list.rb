require 'pry'
class SinglyLinkedList
  attr_accessor :head

  def initialize(first_element=nil)
    @head = Node.new(first_element) if first_element
  end

  def prepend(value)
    node = Node.new(value)
    node.next = @head
    @head = node
    self
  end

  def last
    node = @head
    while node.next
      node = node.next
    end
    node
  end

  def insertAfter(node, value)
    new_node = Node.new(value)
    new_node.next = node.next
    node.next = new_node
    self
  end

  def append(value)
    self.last.next = Node.new(value)
    self
  end

  def remove # removes and return the first node
    @head = self.head.next
  end

  def length
    count = 1
    next_node = @head.next
    unless next_node.nil?
      count += 1
      next_node = next_node.next
    end
    count
  end

  def find(needle)
    node = @head
    while node.value != needle
      return nil if node.next.nil? 
      node = node.next  
    end
    node
  end

  def reverse
    new_list = SinglyLinkedList.new
    node = @head
    while node
      new_list.prepend(node.value)
      node = node.next   
    end
   new_list
  end

  def to_array
    a = []
    head = @head
    while head
      a << head.value
      head = head.next
    end
    a
  end

  def reverse!
    @head = reverse.head
    self
  end

  def to_s
    to_array.join(',')
  end

  class Node
    attr_accessor :value, :next
    def initialize(value=nil)
      @value = value
      @next = nil
    end
  end

end









