Fabricator(:building) do
  name { Faker::Name.first_name + " Hollow" }
  stories { (1..125).to_a.sample }
end

Fabricator(:unit) do
  building(fabricator: :building)
  floor { |attrs| (1..attrs[:building].stories).to_a.sample }
  name { |attrs| "#{attrs[:floor]}#{(?A..?Z).to_a.sample}" }
  bedrooms { (1..10).to_a.sample }
end

Fabricator(:resident) do
  first_name { Faker::Name.first_name }
  last_name  { Faker::Name.last_name }
  birthdate  { Date.today - (100..36500).to_a.sample.days }
end

Fabricator(:occupancy) do
  unit(fabricator: :unit)
  resident(fabricator: :resident)
end

# Fabricator(:building_with_units, from: :building) do
#   units { |attrs| attrs[:stories].times { |story| (3..15).to_a.sample.times { Fabricate.build(:unit, {floor: story + 1}) } } }
# end
