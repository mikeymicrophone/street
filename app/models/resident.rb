class Resident < ActiveRecord::Base
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :birthdate, presence: true
end
