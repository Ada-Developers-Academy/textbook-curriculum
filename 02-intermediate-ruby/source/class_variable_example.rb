#!/usr/bin/ruby

class Library
  attr_reader :library_name
  @@tagline = "Welcome to all of the libraries:"

  def initialize(name)
    @library_name = name
    @@tagline = @@tagline + " " + @library_name
  end

  def tagline
    puts @@tagline
  end

end

library1 = Library.new("Woodland Library")
library2 = Library.new("Northview Library")
library1.tagline
library2.tagline
