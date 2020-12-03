class Mechanic < ApplicationRecord
  has_many :game_mechanics, dependent: :destroy
end
