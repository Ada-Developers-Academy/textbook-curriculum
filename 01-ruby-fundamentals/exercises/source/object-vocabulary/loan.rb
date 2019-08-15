require "date"

class Loan
  attr_reader :title, :check_out_date, :due_date, :check_in_date

  def initialize(title)
    @title = title
    @check_out_date = Date.today

    # Books are due 4 weeks from check out date
    @due_date = Date.today + (4 * 7)

    # For loans that haven't been checked in check_in_date is nil.
    # Instance variables that haven't been initialized have
    # a default value of nil, so we don't need the next line
    # check_in_date = nil
  end

  def check_in
    @check_in_date = Date.today
  end

  def overdue?
    # For a book to be overdue, two things must be true:
    # - The current date must be later than the loan's due date
    # - The book must not be checked in (check_in_date is nil)
    return @due_date < Date.today && @check_in_date.nil?
  end
end
