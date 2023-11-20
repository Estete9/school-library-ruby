class Person

  attr_reader :id
  attr_accessor :name, :age

  def initialize( age, name = "Unknown", parent_permission = true)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def of_age?
    return true if @age >= 18
    false
  end

  def can_use_services?
    return true if of_age? || @parent_permission
    false
  end
end