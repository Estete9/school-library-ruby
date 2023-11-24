# frozen_string_literal: true

class Classroom
  attr_accessor :label
  attr_reader :students, :teachers, :books

  def initialize(label: 'Unknown')
    @label = label
    @students = []
    @teachers = []
    @books = []
  end

  def add_student(student)
    @students << student
    student.classroom = self
  end

  def add_teacher(teacher)
    @teachers << teacher
    teacher.classroom = self
  end

  def add_book(book)
    @books << book
    book.classroom = self
  end

  def list_of_students
    @students
  end

  def list_of_teachers
    @teachers
  end

  def list_of_people
    list_of_students + list_of_teachers
  end

  def list_of_books
    @books
  end
end
