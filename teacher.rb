class Teacher < Person
  attr_reader :classroom

  def initialize(age, specialization, classroom, name: 'Unknown', parent_permission: true)
    super(age, name: name, parent_permission: parent_permission)
    @specialization = specialization
    @classroom = classroom
    @classroom.add_teacher(self)
  end

  def can_use_services?
    true
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.teachers << self unless classroom.teachers.include?(self)
  end
end
