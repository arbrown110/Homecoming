class Playlist < ApplicationRecord
  belongs_to :user
  belongs_to :school
  has_many :songs 
  
  accepts_nested_attributes_for :songs
 
  validates :title, :events, presence: true
  validates :title, uniqueness: true
  validates :school_id, presence: true
  validates_associated :school

  scope :alpha, -> {order(:name) }


  def Limited
    today_limits = user.playlists.select do |c|
      c.created_at.try(:to_date) == Date.today
    end
    if today_limits.size > 2
    errors.add(:playlist_id, " can't be created past 2 daily. ")
    end
  end


end


