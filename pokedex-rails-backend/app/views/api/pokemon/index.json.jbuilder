# json.array! @pokemons, :id, :number, :name, :image_url, :captured


@pokemons.each do |pokemon|
    json.set! pokemon.id do
        json.number pokemon.number
        json.name pokemon.name
        json.image_url pokemon.image_url
        json.captured pokemon.captured
    end
end