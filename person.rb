# frozen_string_literal: true

require_relative 'nameable'
require_relative 'person'
require_relative 'base_decorator'
require_relative 'capitalize_decorator'
require_relative 'trimmer_decorator'

class Person < Nameable
  attr_reader :id
  attr_accessor :name, :age, :rentals

  USED_IDS = []

  def initialize(age, name: 'Unknown', parent_permission: true)
    super()
    @id = generate_id
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def can_use_services?
    return true if of_age? || @parent_permission

    false
  end

  def correct_name
    @name
  end

  def add_rental(book, date)
    rental = Rental.new(date, book, self)
    @rentals << rental
  end

  private

  def of_age?
    return true if @age >= 18

    false
  end

  def generate_id
    loop do
      new_id = rand(1..1_000)
      unless USED_IDS.include?(new_id)
        USED_IDS << new_id
        return new_id
      end
    end
  end
end
