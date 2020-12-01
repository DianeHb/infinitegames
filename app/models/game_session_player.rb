class GameSessionPlayer < ApplicationRecord
  belongs_to :games_sessions
  belongs_to :player, polymorphic: true
end
