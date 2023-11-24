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
    new_book
  end
end
