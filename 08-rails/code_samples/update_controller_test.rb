describe "update" do
  before do
    Book.create(title: "We're all wonders", author: " R.J. Palacio", description: "Good kids book" 
  end
  let (:new_book_hash) {
    {
          book: {
            title: 'A Wrinkle in Time',
            author: "Madeleine L'Engle",
            description: 'A fabulous adventure'
          }
    }
  }
  it "will update a model with a valid post request" do
    id = Book.first.id
    expect {
      patch book_path(id), params: new_book_hash
    }.wont_change 'Book.count'

    must_respond_with :redirect

    book = Book.find_by(id: id)
    expect(book.title).must_equal book_hash[:book][:title]
    expect(book.author_id).must_equal book_hash[:book][:author_id]
    expect(book.description).must_equal book_hash[:book][:description]
  end

  it "will not update if the params are invalid" do
    id = Book.first.id
    original_book = Book.find_by(id: id)
    
    expect {
      patch book_path(id), params: { }
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
      patch book_path(id), params: new_book_hash
    }.wont_change 'Book.count'

    must_respond_with :not_found
  end
end
