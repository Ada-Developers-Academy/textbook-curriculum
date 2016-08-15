class User
  attr_accessor :username, :first_name, :last_name

  def initialize(first, last)
    @first_name = first
    @last_name = last
    @username = make_username
  end

  def full_name
    "#{ @first_name } #{ @last_name }"
  end

  def name_with_username
    "#{ full_name }: #{ @username }"
  end

  def make_username
    first_letter = @first_name[0] # first_letter is a local variable
    "#{ first_letter }-#{ @last_name }"
  end
end
