require_relative "loan"

class Patron
  attr_reader :first_name, :last_name, :email, :loans

  def initialize(first_name, last_name, email)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @loans = []
  end

  def overdue_books
    overdues = []
    @loans.each do |loan|
      if loan.overdue?
        overdues << loan
      end
    end
    return overdues
  end

  def check_out(title)
    loan = Loan.new(title)
    @loans << loan
  end

  def check_in(title)
    @loans.each do |loan|
      if loan.title == title
        loan.check_in
      end
    end
  end
end
