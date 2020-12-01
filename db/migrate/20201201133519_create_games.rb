class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.string :name
      t.string :description
      t.integer :min_players
      t.integer :max_players
      t.integer :min_age
      t.integer :min_playtime
      t.integer :max_playtime
      t.string :editor
      t.string :creators
      t.float :rating_general
      t.string :image_url
      t.timestamps
    end
  end
end
