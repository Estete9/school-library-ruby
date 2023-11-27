class Book
  attr_accessor :title, :author, :rentals

  def initialize(title, author, classroom)
    @title = title
    @author = author
    @rentals = []
    @classroom = classroom
    @classroom.add_book(self)
  end

  def add_rental(person, date)
    rental = Rental.new(date, self, person)
    @rentals << rental
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.books << self unless classroom.books.include?(self)
  end
end
