json.array!(@profils) do |profil|
  json.extract! profil, :id, :prenom, :sexe, :age, :phone, :address, :website, :codePostal, :ville
  json.url profil_url(profil, format: :json)
end
