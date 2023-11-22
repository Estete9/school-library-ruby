# frozen_string_literal: true



class Person < Nameable
  attr_reader :id

  attr_accessor :name, :age



  def initialize(age, name: 'Unknown', parent_permission: true)
    super()

    @name = name

    @age = age

    @parent_permission = parent_permission
  end



  private



  def of_age?
    return true if @age >= 18



    false
  end

  def can_use_services?
    return true if of_age? || @parent_permission



    false
  end

  def correct_name
    @name
  end
end
