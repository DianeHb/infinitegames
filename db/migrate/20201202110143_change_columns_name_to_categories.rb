class ChangeColumnsNameToCategories < ActiveRecord::Migration[6.0]
  def change
    rename_column :categories, :id_api, :boardgamesatlas_id
  end
end
