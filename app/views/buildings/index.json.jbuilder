json.array!(@buildings) do |building|
  json.extract! building, :id, :name, :stories
  json.url building_url(building, format: :json)
end
