# frozen_string_literal: true

class Classroom
  attr_accessor :label
  attr_reader :students

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
end
