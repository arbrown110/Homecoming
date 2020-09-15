class School < ApplicationRecord
  has_many :playlists
  has_many :songs
  has_many :users, through: :playlists
  has_many :sorted_schools, -> {order_by_school}, class_name: 'School'
  validates :name, :city, :state, presence: true
end



