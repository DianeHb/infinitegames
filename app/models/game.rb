class Game < ApplicationRecord
  has_many :game_categories, dependent: :destroy
  has_many :game_mechanics, dependent: :destroy
  has_many :categories, through: :game_categories
  has_many :mechanics, through: :game_mechanics
  has_many :reviews, dependent: :destroy
  has_many :library_games, dependent: :destroy
  has_many :game_sessions, dependent: :destroy

  validates :name, presence: true
  validates :description, presence: true
  validates :min_players, presence: true
  validates :max_players, presence: true
  validates :min_age, presence: true
  validates :min_playtime, presence: true
  validates :max_playtime, presence: true
  validates :image_url, presence: true

end
