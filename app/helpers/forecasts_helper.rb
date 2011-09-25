module ForecastsHelper
  def format_time(time)
    # (time.hour == 0) && "%k:%M" || 
    time.strftime((time.hour == 0) && "%k:%M" || "%l:%M").lstrip
  end
end
