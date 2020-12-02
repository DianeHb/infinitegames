class ChangeColumnsNameToMechanics < ActiveRecord::Migration[6.0]
  def change
    rename_column :mechanics, :id_api, :boardgamesatlas_id
  end
end
