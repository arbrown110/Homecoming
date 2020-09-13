class School < ApplicationRecord
  belongs_to :user
  has_many :playlist
  has_many :users, through: :playlist
  
end
