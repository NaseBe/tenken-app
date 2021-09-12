class Tenken < ApplicationRecord
  belongs_to :user
  has_many :checksheets, dependent: :destroy

  validates :name, presence: true
end
