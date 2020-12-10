module ApplicationHelper
  def game_short_description(game)
    desc = game.description.scan(/<.*>.*<\/.*>/).first
    if desc
      desc = desc[0..200]+"..." if desc.length > 200
    else
      desc = game.description[0..200]+"..."
    end
    return desc
  end

  def game_short_description_library(game)
    desc = game.game.description.scan(/<.*>.*<\/.*>/).first
    if desc
      desc = desc[0..500]+"..." if desc.length > 500
    else
      desc = game.game.description[0..500]+"..."
    end
    return desc
  end
end
