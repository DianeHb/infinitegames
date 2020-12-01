class CreateGameMechanics < ActiveRecord::Migration[6.0]
  def change
    create_table :game_mechanics do |t|
      t.references :mechanic, null: false, foreign_key: true
      t.references :game, null: false, foreign_key: true

      t.timestamps
    end
  end
end
