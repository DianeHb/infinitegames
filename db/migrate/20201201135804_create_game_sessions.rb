class CreateGameSessions < ActiveRecord::Migration[6.0]
  def change
    create_table :game_sessions do |t|
      t.references :game, null: false, foreign_key: true
      t.date :date
      t.references :user, null: false, foreign_key: true
      t.integer :duration
      t.text :comment

      t.timestamps
    end
  end
end
