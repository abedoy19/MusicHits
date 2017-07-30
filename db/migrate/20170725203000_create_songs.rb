class CreateSongs < ActiveRecord::Migration[5.1]
  def change
    create_table :songs do |t|
      t.string :name
      t.string :singer
      t.string :album
      t.string :genre
      t.integer :year
      t.integer :duration

      t.timestamps
    end
  end
end
