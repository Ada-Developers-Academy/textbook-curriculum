#!/usr/bin/ruby

class Library
  @@status = "closed"

  def status
    puts "The library is " + @@status
  end

  def open_library
    @@status = "open"
  end

  def close_library
    @@status = "closed"
  end
end

library1 = Library.new
library2 = Library.new
library1.status
library2.status
library1.open_library
library1.status
library2.status
library2.close_library
library1.status
library2.status
