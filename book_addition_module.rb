module BookAdditionModule
  def book_info
    p 'Title:'
    title = gets.chomp
    p 'Author:'
    author = gets.chomp

    [title, author]
  end

  def create_book(classroom = @classroom)
    title, author = book_info
    new_book = Book.new(title, author, classroom)
    p 'Book created successfully'
    puts "new_book.title #{new_book.title}"
    puts "new_book.author #{new_book.author}"
    new_book
  end
end
