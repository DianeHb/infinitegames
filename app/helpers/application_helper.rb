module ApplicationHelper
  def game_short_description(game)
    desc = game.description.scan(/<.*>.*<\/.*>/).first
    if desc
      desc = desc[0..200]+"..." if desc.length > 160
    else
      desc = game.description[0..200]+"..."
    end
    return desc
  end

  def game_short_description_library(game)
    sanitize(@game.game.description)[0..700]+"..."
  end
end
