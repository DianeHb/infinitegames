class AddIdApiToMechanics < ActiveRecord::Migration[6.0]
  def change
    add_column :mechanics, :id_api, :string
  end
end
