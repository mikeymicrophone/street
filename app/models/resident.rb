class Resident < ActiveRecord::Base
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :birthdate, presence: true
  has_one :occupancy
  has_one :building, through: :unit
  has_one :unit, through: :occupancy
  
  attr_accessor :social_range
  
  def name
    "#{first_name} #{last_name}"
  end
  
  def move!(age_tolerence = 5)
    units_with_vacancy = Unit.all.select { |u| u.has_vacancy? }
    appropriate_units = units_with_vacancy.select do |unit|
      unit.residents.all? { |resident| within_age_tolerance?(resident, age_tolerence) }
    end
    if appropriate_units.present?
      occupancy.destroy
      appropriate_units.sample.occupancies.create :resident => self
    end
  end
  
  def can_meet(other_resident)
    (other_resident.building.id - building.id).abs <= (other_resident.bike_range + bike_range)
  end
  
  def bike_range
    (100 - age) / 10
  end
  
  def potential_friends(local_bike_range)
    local_bike_range = local_bike_range || bike_range
    building_id = building.id
    low = building_id - local_bike_range
    high = building_id + local_bike_range
    
    Building.find_by(id: (low..high).to_a).inject(0) do |friends, building|
      friends += building.residents.count
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
  
  def meetable_people
    all.select { |r| can_meet? r }
  end
  
  def self.largest_social_pool(count = 10)
    all.sort_by { |resident| resident.meetable_people }[0..10]
    
    social_pools = []
    all.each do |resident|
      count = -1
      all.each do |other_resident|
        count += resident.can_meet(other_resident) ? 1 : 0
      end
      resident.instance_variable_set("@social_range", count)
      social_pools.push(resident)
    end
    
    social_pools.sort_by! { |resident| resident.instance_variable_get("@social_range") }[0..9]
  end
end
