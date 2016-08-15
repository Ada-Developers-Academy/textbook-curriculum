# OptionalArguments.rb

# Normal arguments
def foo(a, b, c)
  puts [a, b]
  puts c
end

# Default Arguments
def foo2(a, b, c = "Example")
  puts [a, b]
  puts c
end

# Array Arguments
def sampleArgs(*args)
  args.each do |arg|
    puts arg
  end
end


# Using Array Arguments
def sampleArgs(a, b, c = 'sample', *d, e)
  print [a, b, c].to_s + "\n"
  puts d.to_s
  puts e
end

class Book

  # Hash Parameters
  def initialize(args)
    @title = args[:title]
    @author = args[:author]
    @isbn = args[:isbn]
  end

  # Alternative initialize
  #  def initialize (title, args)
  #    @title = title
  #    @author = args[:author]
  #    @isbn   = args[:isbn]
  #  end

  # Mixing a Hash Parameter with regular parameters
  # def initialize(title, args = {})
  #     defaults = {:author => "Ada Lovelace", :isbn => "1234-412"}
  #     defaults.merge(args)
  # end
end

# Hash Parameters
def dog(name:  "Fido", breed: "Labrador", weight: 130)
	puts name + " is a " + breed.to_s + " weighing " + weight.to_s
end

dog
dog(name: 'Spot')


# Another hash Parameter
def foo(bar: 'default')
  puts bar
end

foo # => 'default'
foo(bar: 'baz') # => 'baz'


#sampleArgs(1, 2, 3)
