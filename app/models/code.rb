class Code < ApplicationRecord
  belongs_to :user
  has_many :tickets, dependent: :destroy

  validates :code, presence: true, uniqueness: true
end
