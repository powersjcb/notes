# expect to be passed local pokemon
json.extract!(pokemon, :id, :attack, :defense, :image_url,
  :moves, :name, :poke_type)

if display_toys
  json.toys do
    json.array!(pokemon.toys) do |toy|
      json.partial!("toys/toy", toy: toy)
    end
  end
end
