class Unit < ActiveRecord::Base
  belongs_to :building
  has_many :occupancies
  has_many :residents, through: :occupanies
  
  validates :building, presence: true
  validates :floor, numericality: {greater_than_or_equal_to: 1}, presence: true
  validates :name, presence: true, uniqueness: {scope: :building_id}
  validates :bedrooms, numericality: {greater_than_or_equal_to: 1}, presence: true
  
  def has_vacancy?
    bedrooms > occupancies.count
  end
end
