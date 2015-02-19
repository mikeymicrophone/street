class Occupancy < ActiveRecord::Base
  belongs_to :unit
  belongs_to :resident
  validates :unit, presence: true
  validates :resident, presence: true
end
