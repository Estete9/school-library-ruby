# frozen_string_literal: true

class CapitalizeDecorator < BaseDecorator
  def correct_name
    super.upcase
  end
end
