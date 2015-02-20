class Building < ActiveRecord::Base
  has_many :units
  has_many :residents, through: :occupancies
  has_many :occupancies, through: :units
  validates :stories, numericality: {greater_than_or_equal_to: 1}, presence: true
end
