class Game < ApplicationRecord
  has_many :game_categories
  has_many :game_mechanics
  has_many :categories, through: :game_categories
  has_many :mechanics, through: :game_mechanics
  has_many :reviews
  has_many :library_games
  has_many :games_sessions

  validates :name, presence :true
  validates :description, presence :true
  validates :min_players, presence :true
  validates :max_players, presence :true
  validates :min_playtime, presence :true
  validates :max_playtime, presence :true

end
