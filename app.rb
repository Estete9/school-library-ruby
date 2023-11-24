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

  def student_or_teacher(option)
    if (option == 1)
      p 'Age: '
      age = gets.chomp
      p 'Name: '
      name = gets.chomp
      p 'Has parent permission? [Y/N]: '
      parent_permission = gets.chomp
      new_student = create_student(age, name: name, parent_permission: parent_permission)
      p 'Student created successfully'
      return new_student
    end

    if (option == 2)
      p 'Age: '
      age = gets.chomp
      p 'Name: '
      name = gets.chomp
      p 'Specialization: '
      specialization = gets.chomp
      new_teacher = create_teacher(age, specialization, name: name)
      p 'Student created successfully'
      return new_teacher
    end
  end

  def print_menu
    puts 'Welcome to School Library App!'
    puts
    @menu_options.each_with_index { |option, index| puts "#{index} - #{option}" }
    user_option = gets.chomp
    #here we need to implement a decision maker, for now we just call the function directly
    student_or_teacher(user_option)
    # add_person_to_classroom()
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
