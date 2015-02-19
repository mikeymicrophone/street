class Unit < ActiveRecord::Base
  belongs_to :building
  
  validates :building, presence: true
  validates :floor, numericality: {greater_than_or_equal_to: 1}, presence: true
  validates :name, presence: true, uniqueness: {scope: [:building_id, :floor]}
  validates :bedrooms, numericality: {greater_than_or_equal_to: 1}, presence: true
end
