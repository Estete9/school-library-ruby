module PersonAdditionModule
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

  def create_teacher(classroom = @classroom)
    age, name, specialization = teacher_info
    new_teacher = Teacher.new(age, specialization, classroom, name: name)
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
end
