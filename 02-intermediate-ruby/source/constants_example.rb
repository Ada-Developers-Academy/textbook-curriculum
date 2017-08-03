#!/usr/bin/ruby

class Library
  RENTAL_PERIOD = 14

  def initialize
    # RENTAL_PERIOD = 15
  end

  def checkout_book
    puts "Your book is due in #{RENTAL_PERIOD} days."
  end

end

library = Library.new
library.checkout_book
