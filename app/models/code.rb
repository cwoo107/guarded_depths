class Code < ApplicationRecord
  belongs_to :user

  validates :code, presence: true, uniqueness: true
end
