json.array!(@units) do |unit|
  json.extract! unit, :id, :building_id, :bedrooms, :floor, :name
  json.url unit_url(unit, format: :json)
end
