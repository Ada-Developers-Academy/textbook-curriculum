class Stack
    def initialize()
        @size = 0
        @limit = 10
        @internal_array = Array.new(@limit)
    end

    # Time complexity: O(1)
    def push(value)
        return if @size == @limit # can not add any more
        @internal_array[@size] = value
        @size += 1
    end

    # Time complexity: O(1)
    def pop()
        return nil if @size == 0 # is empty
        @size -= 1
        return @internal_array[@size]        
    end

    def is_empty()
        return @size == 0
    end

    # for debugging
    def print_stack()
        print "The stack is: "
        @size.times do |i|
            print @internal_array[i]
            print " "
        end
        puts
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

my_stack.print_stack()

puts "pop should return 30: #{my_stack.pop()}"
puts "Is the queue empty? #{my_stack.is_empty}"
puts "pop should return 20: #{my_stack.pop()}"
puts "Is the queue empty? #{my_stack.is_empty}"
puts "pop should return 10: #{my_stack.pop()}"
puts "Is the queue empty? #{my_stack.is_empty}"
my_stack.print_stack()

