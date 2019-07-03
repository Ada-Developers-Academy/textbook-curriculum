require_relative "../linked_lists/linked_list"
# relies on a linked list: singly or doubly would do

class Stack
    def initialize()
        @internal_list = LinkedList.new()
    end

    # Time complexity: O(1)
    def push(value)
        @internal_list.insert(value)
    end

    # Time complexity: O(1)
    def pop()
        return @internal_list.remove_head()
    end

    def is_empty()
        return @internal_list.length == 0
    end

    # for debugging
    def print()
        @internal_list.visit
    end
end

my_stack = Stack.new()
puts "Is the queue empty? #{my_stack.is_empty}"

puts "push 10"
my_stack.push(10)
puts "Is the queue empty? #{my_stack.is_empty}"

puts "push 20"
my_stack.push(20)
puts "Is the queue empty? #{my_stack.is_empty}"

puts "push 30"
my_stack.push(30)
puts "Is the queue empty? #{my_stack.is_empty}"

puts "pop should return 30: #{my_stack.pop()}"
puts "Is the queue empty? #{my_stack.is_empty}"
puts "pop should return 20: #{my_stack.pop()}"
puts "Is the queue empty? #{my_stack.is_empty}"
puts "pop should return 10: #{my_stack.pop()}"
puts "Is the queue empty? #{my_stack.is_empty}"
my_stack.print()

