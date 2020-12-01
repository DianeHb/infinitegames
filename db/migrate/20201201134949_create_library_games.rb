class CreateLibraryGames < ActiveRecord::Migration[6.0]
  def change
    create_table :library_games do |t|
      t.references :game, null: false, foreign_key: true
      t.references :owner, foreign_key: { to_table: :users }
      t.boolean :borrowed, default: false
      t.references :borrower, polymorphic: true
      t.date :borrowed_date
      t.timestamps
    end
  end
end
