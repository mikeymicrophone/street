class Building < ActiveRecord::Base
  has_many :units
  validates :stories, numericality: {greater_than_or_equal_to: 1}, presence: true
end
