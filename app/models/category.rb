class Category < ApplicationRecord
  has_many :game_categories, dependent: :destroy
end
