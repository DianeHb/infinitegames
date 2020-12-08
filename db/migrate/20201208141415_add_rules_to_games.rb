class AddRulesToGames < ActiveRecord::Migration[6.0]
  def change
    add_column :games, :rules_url, :string
  end
end
