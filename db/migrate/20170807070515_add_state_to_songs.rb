class AddStateToSongs < ActiveRecord::Migration[5.1]
  def change
    add_column :songs, :state, :string
  end
end
