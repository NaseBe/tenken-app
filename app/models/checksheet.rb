class Checksheet < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :classroom
  belongs_to :tenken
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_one_attached :image

  with_options presence: true do
    validates :classroom_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :staff
    validates :date
    validates :status
  end
end
