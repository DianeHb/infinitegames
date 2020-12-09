class GameSessionPlayer < ApplicationRecord
  belongs_to :game_session
  belongs_to :player, polymorphic: true

  validates :score, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def username
    case self.player_type
    when "User"
      player.username
    when "Guest"
      player.name
    end
  end

end
