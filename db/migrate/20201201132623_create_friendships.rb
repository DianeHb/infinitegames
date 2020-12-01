class CreateFriendships < ActiveRecord::Migration[6.0]
  def change
    create_table :friendships do |t|
      t.string :status
      t.references :friend1, foreign_key: { to_table: :users }
      t.references :friend2, foreign_key: { to_table: :users }
      t.timestamps
    end
  end
end
