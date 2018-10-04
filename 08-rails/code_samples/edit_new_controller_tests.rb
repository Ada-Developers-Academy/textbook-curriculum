describe "new" do
  it "will load the new book page" do
    get new_book_path

    must_respond_with :success
  end
end

describe "edit" do
  it "will load the edit page for valid ids" do
    id = books(:poodr).id

    get edit_book_path(id)

    must_respond_with :success
  end

  it "will respond with not_found for invalid ids" do
    id = books(:poodr).id
    books(:poodr).destroy

    get edit_book_path(id)

    must_respond_with :not_found
  end
end
