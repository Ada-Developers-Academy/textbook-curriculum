describe "show" do
  it "will get show for valid ids" do
    id = books(:poodr).id

    get book_path(id)

    must_respond_with :success
  end

  it "will respond with not_found for invalid ids" do
    id = books(:poodr)
    books(:poodr).destroy

    get book_path(id)

    must_respond_with :not_found
  end
end
