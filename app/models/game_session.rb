class GameSession < ApplicationRecord
  belongs_to :game
  belongs_to :user
  has_many :game_session_players
end
