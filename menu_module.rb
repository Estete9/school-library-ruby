# frozen_string_literal: true

module MenuModule
  MENU_OPTIONS = [
    'List all books',
    'List all people',
    'Create a person',
    'Create a book',
    'Create a rental',
    'List all rentals for a given person\'s id',
    'Exit'
  ].freeze

  def menu_action(option)
    case option
    when '1'
      list_of_books
    when '2'
      list_of_people
    when '3'
      create_person
    when '4'
      create_book
    when '5'
      create_rental
    when '6'
      # list all rentals for a given person id
      puts 'ID of person:'
      person_id = gets.chomp
      list_of_rentals_by_id(person_id)
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
end
