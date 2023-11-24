# frozen_string_literal: true

class App
  def initialize
    @menu_options = [
      'List all books',
      'List all people',
      'Create a person',
      'Create a book',
      'Create a rental',
      'List all rentals for a given person\'s id',
      'Exit'
    ]
    @classroom = Classroom.new
  end

  def create_student(age, name, parent_permission, classroom = @classroom)
    Student.new(age, classroom, name: name, parent_permission: parent_permission)
  end

  def create_teacher(age, specialization, name)
    Teacher.new(age, specialization, name: name)
  end

  def print_menu
    puts 'Welcome to School Library App!'
    puts
    @menu_options.each_with_index { |option, index| puts "#{index} - #{option}" }
    user_option = gets.chomp

  end

  def run
    # App logic here
  end
end

def main
  app = App.new
  app.run
end

main
