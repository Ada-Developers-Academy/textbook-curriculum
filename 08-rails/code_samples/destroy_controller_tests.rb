describe "destroy" do
  describe "destroy" do
    it "can destroy a model" do
      # Arrange
      poodr = Book.new title: "Practical Object Oriented Programming in Ruby", author: "Sandi Metz"

      poodr.save
      id = poodr.id

      # Act
      expect {
        delete book_path(id)

        # Assert
      }.must_change "Book.count", -1

      must_respond_with :redirect
      must_redirect_to books_path
    end
  end

  it "will respond with not_found for invalid ids" do
    expect {
      delete book_path(-1)
    }.wont_change "Book.count"

    must_respond_with :not_found
  end
end
