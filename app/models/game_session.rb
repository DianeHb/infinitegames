class GameSession < ApplicationRecord
  include Abyme::Model #If GEM not included, GEM code not available
  belongs_to :game
  belongs_to :user
  has_many :game_session_players, dependent: :destroy, inverse_of: :game_session
  abyme_for :game_session_players #Method given by gem, which is using nested attributes from RoR / Controller can receive nested parameters (accept nested attributes...)

  validates :duration, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
