class Rental
  attr_accessor :date, :book, :person

  def initialize(date, book, person)
    @date = date
    @book = book
    @person = person
  end

  def complete_rental
    @person.add_rental(@book, @date)
    @book.add_rental(@person, @date)
  end
end
