class Checksheet < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :classroom 
  belongs_to :tenken
  belongs_to :user
end
