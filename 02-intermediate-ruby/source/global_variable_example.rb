#!/usr/bin/ruby

$name = "The Fellowship of the String"

class Library
  def initialize(name)
  end

  def name
    $name = "My favorite library is named " + $name
  end
end

class Book
  def initialize(name)
  end

  def name
    $name = "My favorite book is named " + $name
  end
end

library = Library.new("Woodland Library")
book = Book.new("The Philosopher's Code")
puts library.name
puts book.name
