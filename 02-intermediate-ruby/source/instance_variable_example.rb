#!/usr/bin/ruby

class Library
  attr_reader :library_name

  def initialize(name)
    @library_name = name
  end

end

library1 = Library.new("Woodland Library")
library2 = Library.new("Northview Library")

puts library1.library_name
puts library2.library_name
