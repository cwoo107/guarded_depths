# frozen_string_literal: true

class SidebarComponent < ViewComponent::Base

  def initialize(signed_in:, user:)
    @signed_in = signed_in
    @user = user
  end

  def render?
    @signed_in
  end

end
