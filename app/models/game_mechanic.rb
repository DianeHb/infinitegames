class GameMechanic < ApplicationRecord
  belongs_to :mechanic
  belongs_to :game
end
