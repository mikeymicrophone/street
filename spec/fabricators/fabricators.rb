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
