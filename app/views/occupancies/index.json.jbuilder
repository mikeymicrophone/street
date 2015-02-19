json.array!(@occupancies) do |occupancy|
  json.extract! occupancy, :id, :unit_id, :resident_id
  json.url occupancy_url(occupancy, format: :json)
end
