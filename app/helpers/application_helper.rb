module ApplicationHelper
  def game_short_description(game)
    sanitize(game.description)[0..160]+"..."
  end

  def game_short_description_library(game)
    sanitize(@game.game.description)[0..700]+"..."
  end
end
