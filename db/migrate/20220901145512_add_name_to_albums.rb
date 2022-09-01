class AddNameToAlbums < ActiveRecord::Migration[7.0]
  def change
    add_column :albums, :name, :string
  end
end
