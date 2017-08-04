#!/usr/bin/ruby

class Library
  def open_library
    message = "The library is open"
    puts message
  end

  def close_library
    message = "The library is closed"
    puts message
  end

  # puts message
end

library = Library.new
library.open_library
library.close_library
