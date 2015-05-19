json.array!(@metiers) do |metier|
  json.extract! metier, :id, :name
  json.url metier_url(metier, format: :json)
end
