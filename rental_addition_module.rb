module RentalAdditionModule
  def rental_info
    p 'Select a book from the following list by number:'
    # list_of_books.each_with_index { |book_item, index| puts "#{index}) Title: \"#{book_item.title}\", Author: #{book_item.author}" }
    book = list_of_books[gets.chomp.to_i]
    p 'Select a person from the following list by number (not id):'
    person = list_of_people[gets.chomp.to_i]
    p 'Date: '
    date = gets.chomp

    [book, person, date]
  end

  def create_rental
    book, person, date = rental_info
    new_rental = Rental.new(date, book, person)
    p 'Rental created successfully'
    new_rental
  end
end
