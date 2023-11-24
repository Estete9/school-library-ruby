# frozen_string_literal: true

require_relative 'classroom'
require_relative 'person'
require_relative 'student'
require_relative 'teacher'

class App
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

  def student_info
    p 'Age:'
    age = gets.chomp
    p 'Name:'
    name = gets.chomp
    p 'Has parent permission? [Y/N]:'
    parent_permission_input = gets.chomp.downcase
    parent_permission = parent_permission_input == 'y' ? true : false
    [age, name, parent_permission]
  end

  def teacher_info
    p 'Age:'
    age = gets.chomp
    p 'Name:'
    name = gets.chomp
    p 'Specialization:'
    specialization = gets.chomp
    [age, name, specialization]
  end

  def create_student(classroom = @classroom)
    age, name, parent_permission = student_info
    new_student = Student.new(age, classroom, name: name, parent_permission: parent_permission)
    p 'Student created successfully'
    new_student
  end

  def create_teacher
    age, name, specialization = teacher_info
    new_teacher = Teacher.new(age, specialization, name: name)
    p 'Teacher created successfully'
    new_teacher
  end

  def create_person
    p 'Do you want to create a student (1) or a teacher (2)? [input the number]: '
    option = gets.chomp

    until %w[1 2].include?(option)
      incorrect_input
      create_person
    end

    case option
    when '1'
      create_student
    when '2'
      create_teacher
    end
  end

  def list_of_people
    return @classroom
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
