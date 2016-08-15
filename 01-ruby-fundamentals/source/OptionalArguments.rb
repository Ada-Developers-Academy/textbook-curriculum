
# OptionalArguments.rb

def foo(a, b, c)
  puts [a, b]

  puts c
end

def sampleArgs(a, b, c = 'sample', *d, e)
  print [a, b, c].to_s + "\n"
  puts d.to_s
  puts e
end

class Book
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

  def initialize(title, args = {})
      defaults = {:author => "Ada Lovelace", :isbn => "1234-412"}
      defaults.merge(args)
  end
end

def dog(name:  "Fido", breed: "Labrador", weight: 130)
	puts name + " is a " + breed.to_s + " weighing " + weight.to_s
end

dog
dog(name: 'Spot')

def foo(bar: 'default')
  puts bar
end

foo # => 'default'
foo(bar: 'baz') # => 'baz'


#sampleArgs(1, 2, 3)
