class AddAvatarUrlToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :avatar_url, :string, default: "https://www.gravatar.com/avatar/00000000000000000000000000000000?d=mp&f=y"
  end
end
