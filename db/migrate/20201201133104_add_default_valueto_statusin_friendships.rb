class AddDefaultValuetoStatusinFriendships < ActiveRecord::Migration[6.0]
  def change
    change_column_default :friendships, :status, "pending"
  end
end
