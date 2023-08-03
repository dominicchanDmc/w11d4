class UpdatePokemon < ActiveRecord::Migration[7.0]
  def change
    change_column_default :pokemons, :captured,false
  end
end
