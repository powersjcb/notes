class UsePostgresArray < ActiveRecord::Migration
  def change
    # we remove/add all these columns to preserve the desired order
    remove_column :pokemons, :moves
    remove_column :pokemons, :image_url
    remove_column :pokemons, :created_at
    remove_column :pokemons, :updated_at
    add_column :pokemons, :moves, :string, array: true, after: :poke_type
    add_column :pokemons, :image_url, :string, null: false
    add_column :pokemons, :created_at, :datetime
    add_column :pokemons, :updated_at, :datetime
  end
end
