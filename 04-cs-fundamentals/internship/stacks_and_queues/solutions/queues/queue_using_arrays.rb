class Queue
    def initialize()
        @limit = 3 # item limit for queue
        @size = @limit + 1 # size of the internal array
        @internal_array = Array.new(@size)
        @front = 0
        @back = 0
    end

    # Time complexity: O(1)
    def enqueue(value)
        if is_full
            puts "Queue full. Cannot add."
            return
        end
        
        # add value
        @internal_array[@back] = value

        # move back to next spot
        # if @back == @size - 1
        #     @back = 0
        # else
        #     @back += 1
        # end
        @back = (@back + 1) % @size
    end

    # Time complexity: O(1)
    def dequeue()
        return nil if is_empty

        temp = @internal_array[@front]

        # change where the new front of queue is
        # if @front == @size - 1
        #     @front = 0
        # else
        #     @front += 1
        # end
        @front = (@front + 1) % @size

        return temp
    end

    def is_empty
        return @front == @back
    end

    def is_full
        return @front == (@back + 1) % @size
    end

    # for debugging
    def print_queue()
        i = @front
        while i <= @back
            print @internal_array[i]
            print " "
            i += 1
        end
        puts
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

puts "dequeue should return 10: #{my_queue.dequeue()}"
puts "Is the queue empty? #{my_queue.is_empty}"

puts "enqueue 30"
my_queue.enqueue(30)
puts "Is the queue empty? #{my_queue.is_empty}"
puts "Is the queue full? #{my_queue.is_full}"
my_queue.print_queue()

puts "dequeue should return 20: #{my_queue.dequeue()}"
puts "Is the queue empty? #{my_queue.is_empty}"

puts "dequeue should return 30: #{my_queue.dequeue()}"
puts "Is the queue empty? #{my_queue.is_empty}"

my_queue.print_queue()
