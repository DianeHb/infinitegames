module ApplicationHelper
  def game_short_description(game)
    sanitize(game.description)[0..160]+"..."
  end
end
