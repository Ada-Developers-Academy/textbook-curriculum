describe "show" do
  it "will get show for valid ids" do
    id = books(:poodr).id

    get book_path(id)

    expect(response).must_be :success?
  end

  it "will respond with not_found for invalid ids" do
    id = books(:poodr)
    books(:poodr).destroy

    get book_path(id)

    expect(response).must_be :not_found?
  end
end
