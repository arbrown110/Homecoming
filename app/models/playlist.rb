class Playlist < ApplicationRecord
  belongs_to :user
  belongs_to :school
  has_many :songs 
  
  accepts_nested_attributes_for :songs
 
  validates :title, :songs, :ratings, presence: true
  validates :title, uniqueness: true
  validates :rating, numericality: { less_than_or_equal_to: 10, greater_than: 0,  only_integer: true }
  validates :school_id, presence: true
  validates_associated :school

  def school_attributes=(attributes)
    school = School.find_or_create_by(attributes)
    self.school = school if school.valid? || !self.school
  end

  scope :order_by_name, -> {order(:name)}


end
