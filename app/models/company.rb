class Company < ApplicationRecord
  after_create :get_codes

  belongs_to :user
  has_many :codes, dependent: :destroy

  def get_codes
    GetCodes.new(id, billing_code, user_id).get
  end

end
