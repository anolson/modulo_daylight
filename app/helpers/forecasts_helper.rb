module ForecastsHelper
  def format_time(time)
    format = (time.hour == 0) && "%k:%M" || "%l:%M"
    time.round.strftime(format).lstrip
  end
end
