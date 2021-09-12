class Tenken < ApplicationRecord
  validates :name, presence: true
  
  belongs_to :user
  has_many :checksheets
end
