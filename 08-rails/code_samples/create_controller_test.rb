describe "create" do
  it "can create a book" do
    book_hash = {
      book: {
        title: 'Practical Object Oriented Programming in Ruby',
        author_id: authors(:metz).id,
        description: 'Looking into the mysteries of Ruby!'
      }
    }

    expect {
      post books_path, params: book_hash
    }.must_change 'Book.count', 1

    must_respond_with :redirect
    expect(Book.last.title).must_equal book_hash[:book][:title]
    expect(Book.last.author_id).must_equal book_hash[:book][:author_id]
    expect(Book.last.description).must_equal book_hash[:book][:description]
  end

  it "will not create a book with invalid params" do
    book_hash = {
      book: {
        title: 'Practical Object Oriented Programming in Ruby',
        author_id: Author.last.id + 1, # invalid author_id
        description: 'A fabulous adventure'
      }
    }

    expect {
      post books_path, params: book_hash
    }.wont_change 'Book.count'

    must_respond_with :bad_request
  end
end
