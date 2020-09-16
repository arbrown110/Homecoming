class User < ApplicationRecord
  has_many :schools
  has_many :playlists
  has_many :jams, through: :playlists, source: :school
  has_secure_password

end
