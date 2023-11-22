# frozen_string_literal: true

class TrimmerDecorator < BaseDecorator
  def correct_name
    super.strip
  end
end
