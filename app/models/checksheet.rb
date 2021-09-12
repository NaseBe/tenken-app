class Checksheet < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :classroom 
  belongs_to :tenken
  belongs_to :user

  with_options presence: true do
    validates :classroom_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :staff
    validates :date
    validates :status
  end
end
