# frozen_string_literal: true

class CardComponent < ViewComponent::Base
  def initialize(title:, header:, width:)
    @title = title
    @header = header
    @width = width
  end

end
