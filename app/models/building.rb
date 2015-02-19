class Building < ActiveRecord::Base
  validates :stories, numericality: {greater_than_or_equal_to: 1}, presence: true
end
