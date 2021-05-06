# frozen_string_literal: true

class FooterComponent < ViewComponent::Base
  def initialize(signed_in:)
    @signed_in = signed_in
  end

  def render?
    @signed_in
  end
end
