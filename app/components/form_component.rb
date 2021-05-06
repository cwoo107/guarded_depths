# frozen_string_literal: true

class FormComponent < ViewComponent::Base
  def initialize(object:, user:)
    @object = object
    @user = user
  end

end
