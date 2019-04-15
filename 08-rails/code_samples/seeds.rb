input_books = [
  {
    title: "Between The World and Me",
    author: "Ta-Nehisi Coates",
    publication_date: 2015,
  },
  {
    title: "Bad Feminist",
    author: "Roxane Gay",
    publication_date: 2014,
  },
  {
    title: "Hidden Figures",
    author: "Margot Lee Shetterly",
    description: "The phenomenal true story of the black female mathematicians at NASA",
    publication_date: 2016,
  },
  {
    title: "Practical Object-Oriented Design in Ruby",
    author: "Sandi Metz",
    description: "A great book on object-oriented design",
    publication_date: 2012,
  },
  {
    title: "99 Bottles of OOP",
    author: "Sandi Metz",
    description: "An even more in-depth book on object-oriented design",
    publication_date: 2016,
  },
]

input_authors = [
  {
    name: "Sandi Metz",
  },
  {
    name: "Ta-Nehisi Coates",
  },
  {
    name: "Margot Lee Shetterly",
  },
  {
    name: "Roxane Gay",
  },
]

author_failures = []
input_authors.each do |input_author|
  author = Author.new(name: input_author[:name])
  successful = author.save
  if successful
    puts "Created author: #{author.inspect}"
  else
    author_failures << author
    puts "Failed to save author: #{author.inspect}"
  end
end

puts "Added #{Author.count} author records"
puts "#{author_failures.length} authors failed to save"

book_failures = []
input_books.each do |input_book|
  book = Book.new
  book.title = input_book[:title]
  book.description = input_book[:description]
  book.publication_date = input_book[:publication_date]
  book.author = Author.find_by(name: input_book[:author])
  successful = book.save
  if successful
    puts "Created book: #{book.inspect}"
  else
    book_failures << book
    puts "Failed to save book: #{book.inspect}"
  end
end

puts "Added #{Book.count} book records"
puts "#{book_failures.length} books failed to save"
