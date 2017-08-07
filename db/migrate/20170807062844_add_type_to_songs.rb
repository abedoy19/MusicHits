class AddTypeToSongs < ActiveRecord::Migration[5.1]
  def change
    add_column :songs, :type, :string
  end
end
