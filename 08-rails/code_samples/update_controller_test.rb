describe "update" do
  let (:book_hash) {
    {
          book: {
            title: 'A Wrinkle in Time',
            author_id: Author.last.id, # valid author_id
            description: 'A fabulous adventure'
          }
    }
  }
  it "will update a model with a valid post request" do
    id = books(:poodr).id
    expect {
      patch book_path(id), params: book_hash
    }.wont_change 'Book.count'

    must_respond_with :redirect

    book = Book.find_by(id: id)
    expect(book.title).must_equal book_hash[:book][:title]
    expect(book.author_id).must_equal book_hash[:book][:author_id]
    expect(book.description).must_equal book_hash[:book][:description]
  end

  it "will not update if the params are invalid" do
    id = books(:poodr).id
    original_book = books(:poodr)
    book_hash[:book][:author_id] = -1 # invalid id
    expect {
      patch book_path(id), params: book_hash
    }.wont_change 'Book.count'

    must_respond_with :error

    book = Book.find_by(id: id)
    expect(book.title).must_equal original_book.title
    expect(book.author_id).must_equal original_book.author_id
    expect(book.description).must_equal original_book.description
  end

  it "will respond with not_found for invalid ids" do
    id = -1

    expect {
      patch book_path(id), params: book_hash
    }.wont_change 'Book.count'

    must_respond_with :not_found
  end
end
