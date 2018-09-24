describe "new" do
  it "will load the new book page" do
    get new_book_path

    expect(response).must_be :success?
  end
end

describe "edit" do
  it "will load the edit page for valid ids" do
    id = books(:poodr).id

    get edit_book_path(id)

    expect(response).must_be :success?
  end

  it "will respond with not_found for invalid ids" do
    id = books(:poodr).id
    books(:poodr).destroy

    get edit_book_path(id)

    expect(response).must_be :not_found?
  end
end
