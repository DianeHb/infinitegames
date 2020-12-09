module StatisticsHelper
  def duration_in_words(duration)
    hours = duration/60
    mins  = duration - hours*60
    text  = ""
    text << "#{hours}h" if hours > 0
    text << "#{mins}min" if mins > 0

    return text
  end

  def winner_first_players(players)

    players.sort_by { |player| player.winner == true ? 0 : 1 }

  end
end
