describe "create" do
  it "can create a book" do
    book_hash = {
      book: {
        title: 'Practical Object Oriented Programming in Ruby',
        author: "Sandi Metz",
        description: 'Looking into the mysteries of Ruby!'
      }
    }

    expect {
      post books_path, params: book_hash
    }.must_change 'Book.count', 1

    must_respond_with :redirect
    expect(Book.last.title).must_equal book_hash[:book][:title]
    expect(Book.last.author).must_equal book_hash[:book][:author]
    expect(Book.last.description).must_equal book_hash[:book][:description]
  end

  it "will not create a book with invalid params" do
    book_hash = { } # invalid params

    expect {
      post books_path, params: book_hash
    }.wont_change 'Book.count'

    must_respond_with :bad_request
  end
end
