# frozen_string_literal: true

require_relative 'classroom'
require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'rental'
require_relative 'person_addition_module'
require_relative 'menu_module'
require_relative 'book_addition_module'
require_relative 'rental_addition_module'

class App
  include PersonAdditionModule
  include MenuModule
  include BookAdditionModule
  include RentalAdditionModule

  def initialize
    @classroom = Classroom.new
    @is_active = true
  end

  def incorrect_input
    puts 'incorrect option, try again.'
    puts
  end

  def list_of_people
    @classroom.list_of_people.each_with_index do |person, index|
      puts "#{index}) [#{person.class.name}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
  end

  def list_of_books
    @classroom.list_of_books.each_with_index do |book_item, index|
      book_title = book_item.title
      book_author = book_item.author
      puts "#{index}) Title: \"#{book_title}\", Author: #{book_author}"
    end
  end

  def run
    # App logic here
    # App loop
    while @is_active
      print_menu
      # user_input
      user_option = gets.chomp
      # decision maker
      menu_action(user_option) unless user_option.empty?
    end
  end
end

def main
  app = App.new
  app.run
end

main
