class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :checksheet

  validates :text, presence: true
end
