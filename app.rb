# frozen_string_literal: true

require_relative 'classroom'
require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'person_addition_module'

class App
  include PersonAdditionModule

  MENU_OPTIONS = [
    'List all books',
    'List all people',
    'Create a person',
    'Create a book',
    'Create a rental',
    'List all rentals for a given person\'s id',
    'Exit'
  ].freeze

  def initialize
    @classroom = Classroom.new
    @is_active = true
  end

  def incorrect_input
    puts 'incorrect option, try again.'
    puts
  end

  def list_of_people
    @classroom.list_of_people.each do |person|
      puts "[#{person.class.name}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
  end

  def menu_action(option)
    case option
    when '1'
      # implement list all books
    when '2'
      list_of_people
    when '3'
      # Create a person
      create_person
    when '4'
      # Create a book
    when '5'
      # create a rental
    when '6'
      # list all rentals for a given person id
    when '7'
      # Exit
      @is_active = false
    else
      incorrect_input
    end
  end

  def print_menu
    puts 'Welcome to School Library App!'
    puts 'Please choose an option by entering a number:'
    MENU_OPTIONS.each_with_index { |option, index| puts "#{index + 1} - #{option}" }
  end

  def run
    # App logic here
    # App loop
    while @is_active
      print_menu
      #user_input
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
