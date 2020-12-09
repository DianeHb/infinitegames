module DurationHelper
  def duration_in_words(duration)
    hours = duration/60
    mins  = duration - hours*60
    text  = ""
    text << "#{hours}h" if hours > 0
    text << "#{mins}min" if mins > 0

    return text
  end
end
