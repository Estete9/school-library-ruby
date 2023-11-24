# frozen_string_literal: true

class Classroom
  attr_accessor :label
  attr_reader :students, :teachers

  def initialize(label: 'Unknown')
    @label = label
    @students = []
    @teachers = []
  end

  def add_student(student)
    @students << student
    student.classroom = self
  end

  def add_teacher(teacher)
    @teachers << teacher
    teacher.classroom = self
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
end
