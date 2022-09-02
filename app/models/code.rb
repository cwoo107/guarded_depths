class Code < ApplicationRecord
  belongs_to :user
  belongs_to :company
  has_many :tickets, dependent: :destroy

  validates :code, presence: true, uniqueness: true
end
