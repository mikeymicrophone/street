class Resident < ActiveRecord::Base
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :birthdate, presence: true
  has_one :occupancy
  
  def name
    "#{first_name} #{last_name}"
  end
  
  def move!(age_tolerence = 5)
    units_with_vacancy = Unit.all.select { |u| u.has_vacancy? }
    appropriate_units = units_with_vancany.select do |unit|
      unit.residents.all? { |resident| within_age_tolerance?(resident, age_tolerence) }
    end
    if appropriate_units.present?
      occupancy.destroy
      appropriate_units.sample.occupancies.create :resident => self
    end
  end
  
  def birth_year
    birthdate.year
  end
  
  def age
    Date.today.year - birth_year
  end
  
  def within_age_tolerance?(potential_roommate, range = 5)
    old_enough = potential_roommate.age >= age - range
    young_enough = potential_roommate.age <= age + range
    old_enough && young_enough
  end
end
