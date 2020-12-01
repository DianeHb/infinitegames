class CreateGameSessionPlayers < ActiveRecord::Migration[6.0]
  def change
    create_table :game_session_players do |t|
      t.references :game_session, null: false, foreign_key: true
      t.references :player, polymorphic: true
      t.boolean :winner, default: false
      t.integer :score

      t.timestamps
    end
  end
end
