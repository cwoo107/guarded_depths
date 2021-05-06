# frozen_string_literal: true

class TableComponent < ViewComponent::Base
  def initialize(data:, **links)
    @data = data
    @links = links
  end

  def render?
    @data.present?
  end

end
