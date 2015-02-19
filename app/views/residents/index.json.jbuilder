json.array!(@residents) do |resident|
  json.extract! resident, :id, :first_name, :last_name, :birthdate
  json.url resident_url(resident, format: :json)
end
