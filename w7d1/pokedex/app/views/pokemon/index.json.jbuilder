json.array!(@pokemon) do |pokemon|
  json.partial!("pokemon", pokemon: pokemon, display_toys: false)
end
