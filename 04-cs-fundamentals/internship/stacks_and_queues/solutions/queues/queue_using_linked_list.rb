require_relative "../linked_lists/linked_list"
# relies on a doubly linked list

class Queue
    def initialize()
        @internal_list = LinkedList.new()
    end

    # Time complexity: O(1)
    def enqueue(value)
        @internal_list.insert(value)
    end

    # Time complexity: O(1)
    def dequeue()
        return @internal_list.remove_tail()
    end

    def is_empty()
        return @internal_list.length == 0
    end

    # for debugging
    def print()
        @internal_list.visit
    end
end

my_queue = Queue.new()
puts "Is the queue empty? #{my_queue.is_empty}"

puts "enqueue 10"
my_queue.enqueue(10)
puts "Is the queue empty? #{my_queue.is_empty}"

puts "enqueue 20"
my_queue.enqueue(20)
puts "Is the queue empty? #{my_queue.is_empty}"

puts "enqueue 30"
my_queue.enqueue(30)
puts "Is the queue empty? #{my_queue.is_empty}"

my_queue.print()

puts "dequeue should return 10: #{my_queue.dequeue()}"
puts "Is the queue empty? #{my_queue.is_empty}"

puts "dequeue should return 20: #{my_queue.dequeue()}"
puts "Is the queue empty? #{my_queue.is_empty}"

puts "dequeue should return 30: #{my_queue.dequeue()}"
puts "Is the queue empty? #{my_queue.is_empty}"

my_queue.print()
